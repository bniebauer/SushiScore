//
//  GameViewController.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 3/14/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var playerList: UITableView!
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        playerList.dataSource = self
        playerList.delegate = self
        roundLabel.text = "Round \(game!.round)"
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "callScoring" {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! ScoringCollectionViewController
            destinationVC.menu = game?.menu
        }
    }
}

extension GameViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return game!.players.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerList.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath)
        cell.textLabel?.text = "\(game!.players[indexPath.row].playerName)"
        return cell
    }
    
}

// Allows the user to interact with each cell
extension PlayerViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
}

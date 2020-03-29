//
//  PlayerViewController.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 2/22/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    
    @IBOutlet weak var playerList: UITableView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var players: [Player]?
    var menu: [Card]?
    var game: Game?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //players = getPlayerData()
        players = []
        playerList.dataSource = self
        playerList.delegate = self
        titleLabel.text = "Add Players"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func startGamePressed(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "callGame", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "callEdit" {
            let navController = segue.destination as! UINavigationController
            let indexPath = tableView.indexPathForSelectedRow!
            let player = players![indexPath.row]
            let destinationVC = navController.topViewController as! AddEditPlayersTableViewController
            destinationVC.player = player
        }
        
        if segue.identifier == "callGame" {
            guard players!.count > 0 else { return }
            game = Game(players: players!, menu: getDefaultMenu(), round: 1)
            let destinationVC = segue.destination as! GameViewController
            destinationVC.game = game
        }
        
    }
    
    @IBAction func unwindToPlayerViewController(segue: UIStoryboardSegue) {
        guard segue.identifier == "callSave" else {return}
        
        let sourceControl = segue.source as! AddEditPlayersTableViewController
        
        if let player = sourceControl.player {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                players![selectedIndexPath.row] = player
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: players!.count,
                section: 0)
                players!.append(player)
                tableView.insertRows(at: [newIndexPath],
                with: .automatic)
            }
        }
    }
    
}

extension PlayerViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return players!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = playerList.dequeueReusableCell(withIdentifier: "ReuseableCell", for: indexPath)
        cell.textLabel?.text = "\(players![indexPath.row].playerName)"
        return cell
    }
    
}

// Allows the user to interact with each cell
extension GameViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}

//
//  AddEditPlayersTableViewController.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 3/8/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
//

import UIKit

class AddEditPlayersTableViewController: UITableViewController {
    
    @IBOutlet weak var playerNameTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    var player: Player?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let player = player {
            playerNameTextField.text = player.playerName
        }
        
        updateSaveButtonState()
    }
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
           
        guard segue.identifier == "callSave" else { return }
        let nameText = playerNameTextField.text ?? ""
        player = Player(name: nameText)
        
    }

    func updateSaveButtonState() {
        let nameText = playerNameTextField.text ?? ""
        saveButton.isEnabled = !nameText.isEmpty
    }

}

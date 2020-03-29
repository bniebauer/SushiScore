//
//  ViewController.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 1/11/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func onStart(_ sender: Any) {
        self.performSegue(withIdentifier: "callPlayerList", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "callPlayerList" {
            let destinationVC = segue.destination as! PlayerViewController
        }
    }


}


/*
//  Player.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 1/11/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
*/

import Foundation

class Player {
    
    let playerName: String
    var score: Int
    
    init(name: String) {
        self.playerName = name
        self.score = 0
    }
}

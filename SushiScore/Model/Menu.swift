//
//  Deck.swift
//  SushiScore
//
//  Created by Brenton Niebauer on 1/11/20.
//  Copyright © 2020 Brenton Niebauer. All rights reserved.
//

import UIKit


struct Card {
    var name: CardName
    var img: UIImage?
    var type: CardType
    var value: Int
}

enum CardName {
    case MakiRoll
    case Tempura
    case Sashimi
    case Dumplings
    case Squid
    case Egg
    case Shrimp
    case Wasabi
    case Chopsticks
    case Puddings
    
    var description : String {
        switch self {
        case .MakiRoll: return "Maki Roll"
        case .Tempura: return "Tempura"
        case .Sashimi: return "Sashimi"
        case .Dumplings: return "Dumplings"
        case .Squid: return "Squid Nigiri"
        case .Egg: return "Egg Nigiri"
        case .Shrimp: return "Shrimp Nigiri"
        case .Wasabi: return "Wasabi"
        case .Chopsticks: return "Chopsticks"
        case .Puddings: return "Pudding"
        }
    }
}

enum CardType {
    case Nigiri
    case Appitizer
    case Dessert
    case Special
}


struct Menu {
    var nigiri: [Card]
    var appitizers: [Card]
    var specials: [Card]
    var dessert: [Card]
}

func getDefaultMenu() -> [Card] {
    var deck = getNigiriCards()
    deck.append(contentsOf: getMakiRollCards())
    deck.append(getCollectingAppitizers(card: .Tempura))
    deck.append(getCollectingAppitizers(card: .Sashimi))
    deck.append(getCollectingAppitizers(card: .Dumplings))
    var special = [Card]()
    
    var dessert = [Card]()
    
    return deck
}

// Get Nigiri Cards
func getNigiriCards() -> [Card] {
    var nigiri = [Card]()
    
    let eggCard = Card(name: .Egg, img: nil, type: .Nigiri, value: 1)
    nigiri.append(eggCard)
    
    let shrimpCard = Card(name: .Shrimp, img: nil, type: .Nigiri, value: 2)
    nigiri.append(shrimpCard)
    
    let squidCard = Card(name: .Squid, img: nil, type: .Nigiri, value: 3)
    nigiri.append(squidCard)
    
    return nigiri
}

// Get Appitizer Cards
func getMakiRollCards() -> [Card] {
    var makiRolls = [Card]()
    
    let oneMaki = Card(name: .MakiRoll, img: nil, type: .Appitizer, value: 1)
    makiRolls.append(oneMaki)
    
    let twoMaki = Card(name: .MakiRoll, img: nil, type: .Appitizer, value: 2)
    makiRolls.append(twoMaki)
    
    let threeMaki = Card(name: .MakiRoll, img: nil, type: .Appitizer, value: 3)
    makiRolls.append(threeMaki)
    
    return makiRolls
}

func getCollectingAppitizers(card: CardName) -> Card{
    return Card(name: card, img: nil, type: .Appitizer, value: 1)
}


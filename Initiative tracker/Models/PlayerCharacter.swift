//
//  Player.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 22/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//

class PlayerCharacter: Character {
    var playerName: String;
    
    init(name: String, hitpoints: Int, initiative: Int, initiativeModifier: Int, playerName: String) {
        self.playerName = playerName
        super.init(name: name, hitpoints: hitpoints, initiative: initiative, initiativeModifier: initiativeModifier)
    }
}

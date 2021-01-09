//
//  Character.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 22/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//

class Character: Codable {
    var name: String
    var hitpoints: Int
    var initiative: Int
    var initiativeModifier: Int
    
    init(name: String, hitpoints: Int, initiative: Int, initiativeModifier: Int) {
        self.name = name
        self.hitpoints = hitpoints
        self.initiative = initiative
        self.initiativeModifier = initiativeModifier
    }
}

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
    
    // SOURCE: https://forums.swift.org/t/inheriting-from-a-codable-class/14874/7
    private enum CodingKeys: String, CodingKey {
        case playerName
    }
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        playerName = try container.decode(String.self, forKey: .playerName)
        try super.init(from: container.superDecoder())
    }
}

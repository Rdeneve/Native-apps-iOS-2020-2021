//
//  Tracker.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 22/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//

struct Tracker {
    var name: String
    var characters: [Character]
    
    init(name: String) {
        self.name = name
        self.characters = [Character(name: "Test 1", hitpoints: 69, initiative: 5, initiativeModifier: 2),
                            Character(name: "Test 2", hitpoints: 58, initiative: 3, initiativeModifier: 1),
                            Character(name: "Test 3", hitpoints: 5, initiative: -3, initiativeModifier: -5)]
    }
    
    // TODO: Codable functionaliteit
    static func loadData() -> [Tracker]? {
        return nil;
    }
    
    static func loadDummyData() -> [Tracker] {
        let tracker1 = Tracker(name: "Goblins")
        let tracker2 = Tracker(name: "Kobolds")
        let tracker3 = Tracker(name: "Bandits")
        
        return [tracker1, tracker2, tracker3]
    }
}

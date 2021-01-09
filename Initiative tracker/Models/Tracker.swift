//
//  Tracker.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 22/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//
import Foundation

struct Tracker: Codable {
    var name: String
    var characters: [Character]?
    
    init(name: String, characters: [Character]?) {
        self.name = name
        self.characters = characters
    }
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveUrl = DocumentsDirectory.appendingPathComponent("trackers").appendingPathExtension("plist")
    
    // TODO: Codable functionaliteit
    static func loadData() -> [Tracker]? {
        guard let codedTrackers = try? Data(contentsOf: ArchiveUrl) else {return nil}
        let propertyListDecoder = PropertyListDecoder()
        return try? propertyListDecoder.decode(Array<Tracker>.self, from: codedTrackers)
    }
    
    static func saveData(_ trackers: [Tracker]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedTrackers = try? propertyListEncoder.encode(trackers)
        try? codedTrackers?.write(to: ArchiveUrl, options: .noFileProtection)
        
    }
    
    static func loadDummyData() -> [Tracker] {
        let characters = [Character(name: "Test 1", hitpoints: 69, initiative: 5, initiativeModifier: 2),
                          Character(name: "Test 2", hitpoints: 58, initiative: 3, initiativeModifier: 1),
                          PlayerCharacter(name: "Test 3", hitpoints: 5, initiative: 5, initiativeModifier: 1, playerName: "Robbe")]
        let tracker1 = Tracker(name: "Goblins", characters: characters)
        let tracker2 = Tracker(name: "Kobolds", characters: characters)
        let tracker3 = Tracker(name: "Bandits", characters: characters)
        
        return [tracker1, tracker2, tracker3]
    }
}

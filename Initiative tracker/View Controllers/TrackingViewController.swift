
//
//  trackingViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 09/01/2021.
//  Copyright © 2021 Robbe De Neve. All rights reserved.
//

import UIKit

class TrackingViewController: UIViewController {
    var tracker: Tracker?
    var current: Character?
    var nextChar: Character?
    var round = 1
    
    override func  viewDidLoad() {
        super.viewDidLoad();
        
        if let tracker = tracker, var characters = tracker.characters {
            // sorteren op initiative -> initiativeMod ascending
            characters.sort {
                ($0.initiative, $0.initiativeModifier) > ($1.initiative, $1.initiativeModifier)
            }
            
            current = characters[0]
            nextChar = characters[1]
            
            titleLabel.text = "Round " + String(round)
            updateLabels()
        }
    }
    
    func updateLabels() {
        titleLabel.text = "Round " + String(round)
        if let current = current, let nextChar = nextChar {
            currentCharacterLabel.text = current.name
            currentInitiativeLabel.text = "Initiative: " + String(current.initiative)
            currentInitiativeModLabel.text = "Modifier: " + String(current.initiativeModifier)
            currentHitpointsLabel.text = "HP: " + String(current.hitpoints)
            
            nextCharacterLabel.text = nextChar.name
            nextInitiativeLabel.text = "Initiative: " + String(nextChar.initiative)
            nextInitiativeModLabel.text = "Modifier: " + String(nextChar.initiativeModifier)
            nextHitpointsLabel.text = "HP: " + String(nextChar.hitpoints)
            
            if let current = current as? PlayerCharacter {
                currentPlayerLabel.text = current.playerName
                currentPlayerLabel.isHidden = false
            } else {
                currentPlayerLabel.isHidden = true
            }
            
            if let nextChar = nextChar as? PlayerCharacter {
                nextPlayerLabel.text = nextChar.playerName
                nextPlayerLabel.isHidden = false
            } else {
                nextPlayerLabel.isHidden = true
            }
        }
    }

    @IBAction func nextButtonPressed(_ sender: Any) {
        current = nextChar
        if let tracker = tracker, let characters = tracker.characters {
            let index = characters.firstIndex { $0 === nextChar }
            if let index = index {
                if index == characters.count - 1 {
                    nextChar = characters.first
                    round += 1
                } else {
                    nextChar = characters[index + 1]
                }
            }
        }
        updateLabels()
    }
    
    @IBAction func stopButtonPressed(_ sender: Any) {
        dismiss(animated: true)
    }
    @IBOutlet var currentCharacterLabel: UILabel!
    @IBOutlet var currentPlayerLabel: UILabel!
    @IBOutlet var currentHitpointsLabel: UILabel!
    @IBOutlet var currentInitiativeLabel: UILabel!
    @IBOutlet var currentInitiativeModLabel: UILabel!
    @IBOutlet var nextCharacterLabel: UILabel!
    @IBOutlet var nextPlayerLabel: UILabel!
    @IBOutlet var nextHitpointsLabel: UILabel!
    @IBOutlet var nextInitiativeLabel: UILabel!
    @IBOutlet var nextInitiativeModLabel: UILabel!
    @IBOutlet var titleLabel: UILabel!
}

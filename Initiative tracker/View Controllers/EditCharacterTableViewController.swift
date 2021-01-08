//
//  EditCharacterTableViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 08/01/2021.
//  Copyright © 2021 Robbe De Neve. All rights reserved.
//

import UIKit

class EditCharacterTableViewController: UITableViewController {
    
    var char: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let char = char as? PlayerCharacter{
            navigationItem.title = "Editing Player Character"
            pcSwitch.isOn = true
            playerNameTextField.isEnabled = true
            playerNameTextField.text = char.playerName
            charNameTextField.text = char.name
            hitpointsTextField.text = String(char.hitpoints)
            initiativeTextField.text = String(char.initiative)
            initiativeModTextField.text = String(char.initiativeModifier)
            
        } else if let char = char {
            print(char.initiative)
            navigationItem.title = "Editing Character"
            pcSwitch.isOn = false
            print(char.name)
            print(char.initiative)
            charNameTextField.text = char.name
            hitpointsTextField.text = String(char.hitpoints)
            initiativeTextField.text = String(char.initiative)
            initiativeModTextField.text = String(char.initiativeModifier)
        }
        
        updateSaveButton()
    }
    
    @IBAction func onChangePcSwitch(_ sender: UISwitch) {
        if sender.isOn {
            playerNameTextField.isEnabled = true
        } else {
            playerNameTextField.isEnabled = false
            playerNameTextField.text = ""
        }
    }
    
    func updateSaveButton() {
        let charName = charNameTextField.text ?? ""
        let hitpoints = hitpointsTextField.text ?? ""
        let initiative = initiativeTextField.text ?? ""
        let initiativeMod = initiativeModTextField.text ?? ""
        
        var validate = !charName.isEmpty && !hitpoints.isEmpty && !initiative.isEmpty && !initiativeMod.isEmpty
        
        if pcSwitch.isOn {
            let playerName = playerNameTextField.text ?? ""
            validate = validate && !playerName.isEmpty
        }
        
        saveButton.isEnabled = validate
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard segue.identifier == "saveCharacter" else { return }
        
        let charName = charNameTextField.text!
        let hitpoints = Int(hitpointsTextField.text ?? "") ?? 0
        let initiative = Int(initiativeTextField.text ?? "") ?? 0
        let initiativeMod = Int(initiativeModTextField.text ?? "") ?? 0
        
        if pcSwitch.isOn {
            let playerName = playerNameTextField.text!
            char = PlayerCharacter(name: charName, hitpoints: hitpoints, initiative: initiative, initiativeModifier: initiativeMod, playerName: playerName)
        } else {
            char = Character(name: charName, hitpoints: hitpoints, initiative: initiative, initiativeModifier: initiativeMod)
        }
    }

    @IBOutlet var playerNameTextField: UITextField!
    @IBOutlet var charNameTextField: UITextField!
    @IBOutlet var hitpointsTextField: UITextField!
    @IBOutlet var initiativeTextField: UITextField!
    @IBOutlet var initiativeModTextField: UITextField!
    @IBOutlet var pcSwitch: UISwitch!
    @IBOutlet var saveButton: UIBarButtonItem!
    

    @IBAction func textChanged(_ sender: UITextField) {
        updateSaveButton()
    }
    @IBAction func returnPressed(_ sender: UITextField) {
        sender.resignFirstResponder()
    }
}

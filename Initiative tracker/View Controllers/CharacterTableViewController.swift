//
//  CharacterTableViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 27/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//
import UIKit

class CharacterTableViewController: UITableViewController {
    
    var characters = [Character]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func willMove(toParent parent: UIViewController?) {
        if let parent = parent as? TrackerDetailViewController {
            parent.tracker?.characters = characters
        }
    }
    
    // aantal rijen per sectie
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    // content van individuele cell specifiëren
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath) as! CharacterTableCell
        let character = characters[indexPath.row]
        cell.characterNameLabel?.text = character.name
        cell.characterInitiativeLabel?.text = "\(character.initiative)"
        
        if character is PlayerCharacter {
            cell.characterTypeLabel?.text = "Player Character"
        } else {
            cell.characterTypeLabel?.text = "DM Character"
        }
        return cell
    }
    
    // swipe-to-delete enablen
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // functionaliteit swipe-to-delete specifiëren
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            characters.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "editCharacter", let editCharViewController = segue.destination as? EditCharacterTableViewController {
            let indexPath = tableView.indexPathForSelectedRow!
            let selectedChar = characters[indexPath.row]
            editCharViewController.char = selectedChar
        }
    }
    
    @IBAction func unwindToCharacterList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveCharacter" else { return }
        let sourceViewController = segue.source as! EditCharacterTableViewController
        
        if let char = sourceViewController.char {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                characters[selectedIndexPath.row] = char
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: characters.count, section: 0)
                characters.append(char)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
    }
    
}

class CharacterTableCell: UITableViewCell {
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterTypeLabel: UILabel!
    @IBOutlet weak var characterInitiativeLabel: UILabel!
}

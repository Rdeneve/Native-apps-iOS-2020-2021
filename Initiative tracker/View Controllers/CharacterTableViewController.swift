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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CharacterCell", for: indexPath)
        let character = characters[indexPath.row]
        cell.textLabel?.text = character.name
        cell.detailTextLabel?.text = "Initiative:" + "\(character.initiative)"
        
        return cell
    }
    
    @IBAction func unwindToTrackerList(unwindSegue: UIStoryboardSegue) {
        
    }
    
}

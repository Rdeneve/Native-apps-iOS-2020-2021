//
//  TrackerDetailViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 07/01/2021.
//  Copyright © 2021 Robbe De Neve. All rights reserved.
//

import UIKit

class TrackerDetailViewController: UIViewController {
    
    var tracker: Tracker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }    
    
    @IBAction func characterButtonOnClick(_ sender: Any) {
        performSegue(withIdentifier: "characterList", sender: self.tracker)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "characterList", let tracker = sender as? Tracker {
            let viewController = segue.destination as! CharacterTableViewController
            viewController.characters = tracker.characters
        }
    }
    
}

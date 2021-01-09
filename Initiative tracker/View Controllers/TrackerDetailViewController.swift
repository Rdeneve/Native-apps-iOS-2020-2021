//
//  TrackerDetailViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 07/01/2021.
//  Copyright © 2021 Robbe De Neve. All rights reserved.
//

import UIKit
import SCLAlertView

class TrackerDetailViewController: UIViewController {
    
    var tracker: Tracker?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "characterList" {
            let viewController = segue.destination as! CharacterTableViewController
            guard let characters = tracker?.characters else { return }
            viewController.characters = characters
        } else if segue.identifier == "editTracker" {
            let viewController = segue.destination as! EditTrackerTableViewController
            viewController.tracker = self.tracker
        } else if segue.identifier == "startTracking" {
            let viewController = segue.destination as! TrackingViewController
            viewController.tracker = self.tracker
        }
    }
    
    @IBAction func startTrackingButtonPressed(_ sender: Any) {
        if let tracker = tracker {
            if let characters = tracker.characters {
                if characters.count > 1 {
                    performSegue(withIdentifier: "startTracking", sender: self)
                } else {
                    SCLAlertView().showError("Not enough characters", subTitle: "You need at least 2 characters to start tracking.")
                }
            } else {
                SCLAlertView().showError("Not enough characters", subTitle: "You need at least 2 characters to start tracking.")
            }
            
        }
    }
}

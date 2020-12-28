//
//  TrackerDetailTableViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 26/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//
import UIKit

class TrackerDetailTableViewController: UITableViewController {
    
    @IBOutlet var saveButton: UIBarButtonItem!
    @IBOutlet var trackerNameTextField: UITextField!
    
    var tracker: Tracker?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let tracker = tracker {
            navigationItem.title = "Tracker"
            trackerNameTextField.text = tracker.name
        }
        updateSaveButton()
    }
    
    func updateSaveButton() {
        let text = trackerNameTextField.text ?? ""
        saveButton.isEnabled = !text.isEmpty
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        let trackerName = trackerNameTextField.text!
        
        tracker = Tracker(name: trackerName)
    }
    
    @IBAction func textChanged(_ sender: Any) {
        updateSaveButton()
    }
    @IBAction func returnPressed(_ sender: Any) {
        trackerNameTextField.resignFirstResponder()
    }
}

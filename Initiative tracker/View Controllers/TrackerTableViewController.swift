//
//  TrackerTableViewController.swift
//  Initiative tracker
//
//  Created by Robbe De Neve on 22/12/2020.
//  Copyright © 2020 Robbe De Neve. All rights reserved.
//
import UIKit

class TrackerTableViewController: UITableViewController {
    
    var trackers = [Tracker]()
    
    override func viewDidLoad() {
        if let savedTrackers = Tracker.loadData() {
            trackers = savedTrackers
        } else {
            trackers = Tracker.loadDummyData();
        }
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    // definieert aantal rijen per sectie
    // in dit geval is het aantal rijen gelijk aan het aantal elementen in de trackers array
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trackers.count
    }
    
    // content van individuele cell specifiëren
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TrackerCell", for: indexPath)
        let tracker = trackers[indexPath.row]
        cell.textLabel?.text = tracker.name
        return cell
    }
    
    // swipe-to-delete enablen
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // functionaliteit swipe-to-delete specifiëren
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            trackers.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    // segue naar volgende scherm door op rij te klikken
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        performSegue(withIdentifier: "trackerDetail", sender: trackers[row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        if segue.identifier == "trackerDetail", let tracker = sender as? Tracker {
            let viewController = segue.destination as! TrackerDetailViewController
            viewController.tracker = tracker
            viewController.title = tracker.name
        }
    
    }
    
    
    @IBAction func unwindToTrackerList(segue: UIStoryboardSegue) {
        guard segue.identifier == "saveUnwind" else { return }
        let sourceViewController = segue.source as! EditTrackerTableViewController
        
        if let tracker = sourceViewController.tracker {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                trackers[selectedIndexPath.row] = tracker
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            } else {
                let newIndexPath = IndexPath(row: trackers.count, section: 0)
                trackers.append(tracker)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
                
            }
        }
    }
}

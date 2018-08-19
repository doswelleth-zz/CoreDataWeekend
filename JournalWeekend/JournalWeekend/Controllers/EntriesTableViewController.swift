//
//  EntriesTableViewController.swift
//  JournalWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/19/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit
import CoreData

class EntriesTableViewController: UITableViewController {
    
    let entryController = EntryController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return entryController.entries.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! EntryTableViewCell

        let entry = entryController.entries[indexPath.row]
        
        cell.entry = entry
        
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let entry = entryController.entries[indexPath.row]
            
            let moc = CoreDataStack.shared.mainContext
            moc.delete(entry)
            
            do {
                try moc.save()
            } catch {
                NSLog("Error deleting entry: \(error)")
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
 
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let detailVC = segue.destination as? EntryDetailViewController
        
        if segue.identifier == "showCreateEntry" {
            detailVC?.entryController = entryController
        } else {
            if let indexPath = tableView.indexPathForSelectedRow {
             detailVC?.entry = entryController.entries[indexPath.row]
            }
        }
    }

}

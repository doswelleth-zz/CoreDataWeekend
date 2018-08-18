//
//  TasksWeekendTableViewController.swift
//  TasksWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/18/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit
import CoreData

class TasksWeekendTableViewController: UITableViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return tasksWeekends.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TasksWeekendCell", for: indexPath)
        
        let tasksWeekend = tasksWeekends[indexPath.row]
        cell.textLabel?.text = tasksWeekend.name

        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let taskWeekend = tasksWeekends[indexPath.row]
            let moc = CoreDataStack.shared.mainContext
            moc.delete(taskWeekend)
            
            do {
                try moc.save()
            } catch {
                moc.reset()
            }
            tableView.reloadData()
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "showTasksWeekendDetail" {
            let detailVC = segue.destination as! TasksWeekendDetailViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                detailVC.tasksWeekend = tasksWeekends[indexPath.row]
            }
        }
    }
    

    // MARK: - Properties
    
    var tasksWeekends: [TasksWeekend] {
        let fetchRequest: NSFetchRequest<TasksWeekend> = TasksWeekend.fetchRequest()
        
        let moc = CoreDataStack.shared.mainContext
        
        do {
            return try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error: \(error)")
            return []
        }
    }
    
    
}

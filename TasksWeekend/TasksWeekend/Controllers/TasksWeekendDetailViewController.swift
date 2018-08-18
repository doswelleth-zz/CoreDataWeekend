//
//  TasksWeekendDetailViewController.swift
//  TasksWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/18/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class TasksWeekendDetailViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
        
    }
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var notesTextView: UITextView!
    
    @IBAction func save(_ sender: Any) {
        
        guard let name = nameTextField.text, !name.isEmpty else { return
            
        }
        let notes = notesTextView.text
        
        if let taskWeekend = tasksWeekend {
            // Editing an existing task
            taskWeekend.name = name
            taskWeekend.notes = notes
        } else {
            // Creating a new task
            let _ = TasksWeekend(name: name, notes: notes)
        }
        
        do {
            // try to save context
            let moc = CoreDataStack.shared.mainContext
            try moc.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
        navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard isViewLoaded else { return }
        
        self.title = tasksWeekend?.name ?? "Create Weekend Task"
        nameTextField.text = tasksWeekend?.name
        notesTextView.text = tasksWeekend?.notes
    }
    
    // MARK: - Properties
    
    var tasksWeekend: TasksWeekend? {
        didSet {
            updateViews()
        }
    }
    
    
}

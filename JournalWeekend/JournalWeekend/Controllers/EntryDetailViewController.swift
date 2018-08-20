//
//  EntryDetailViewController.swift
//  JournalWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/19/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    
    // MARK: - Properties
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    var entryController: EntryController!
    
    // MARK: - Outlets
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBAction func saveButton(_ sender: Any) {
        
        guard let title = textField.text, !title.isEmpty, let body = textView.text else { return }
        
        let mood = EntryMood.neutral.rawValue

        if let entry = entry {
            entryController.update(entry: entry, title: title, bodyText: body, mood: mood)
        } else {
            entryController.create(title: title, bodyText: body, mood: mood)
        }
        entryController.saveToPersistentStore()
        navigationController?.popViewController(animated: true)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    func updateViews() {
        guard isViewLoaded else { return }
        self.title = entry?.title ?? "Create Entry"
        textField.text = entry?.title
        textView.text = entry?.bodyText
    }
    
}

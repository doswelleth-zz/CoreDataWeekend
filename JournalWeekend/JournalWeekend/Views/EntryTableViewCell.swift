//
//  EntryTableViewCell.swift
//  JournalWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/19/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import UIKit

class EntryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    var entry: Entry? {
        didSet {
            updateViews()
        }
    }
    
    // MARK: - Outlets

    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var bodyText: UILabel!
    
    @IBOutlet weak var timestamp: UILabel!
    
    // MARK: - Function that takes the values from the entry variable and places them in the outlets
    
    private func updateViews() {
       guard let title = entry?.title, let body = entry?.bodyText, let timestamp = entry?.timestamp else { return }
        
        self.titleLabel.text = title
        self.bodyText.text = body
        self.timestamp.text = timestamp.description
        
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short
        formatter.date(from: timestamp.description)
    }
    
}

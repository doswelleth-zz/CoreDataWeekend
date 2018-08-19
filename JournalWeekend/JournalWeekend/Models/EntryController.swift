//
//  EntryController.swift
//  JournalWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/19/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
    // MARK: - Singleton
    
    let moc = CoreDataStack.shared.mainContext
    
    // MARK: - Properties
    
    var entries: [Entry] {
        return loadFromPersistentStore()
    }
    
    func saveToPersistentStore() {
        
        do {
            try moc.save()
        } catch {
            NSLog("Error saving context: \(error)")
        }
        
    }
    
    func loadFromPersistentStore() -> [Entry] {
        let fetchRequest: NSFetchRequest<Entry> = Entry.fetchRequest()
        do {
            let _ = try moc.fetch(fetchRequest)
        } catch {
            NSLog("Error fetching entries: \(error)")
        }
        return []
    }
    
    func create(entry: Entry, title: String, bodyText: String, identifier: String, timestamp: Date) {
        
        entry.title = title
        entry.bodyText = bodyText
        entry.identifier = identifier
        entry.timestamp = timestamp
        
        do {
            try moc.save()
        } catch {
            NSLog("Error saving entry: \(error)")
        }
    }
    
    func update(entry: Entry, title: String, bodyText: String) {
        let scratch = entry
        
        scratch.title = title
        scratch.bodyText = bodyText
        scratch.timestamp = Date()
        
        do {
            try moc.save()
        } catch {
            NSLog("Error saving entry: \(error)")
        }
    }
    
    func delete(entry: Entry) {
        moc.delete(entry)
        
        do {
            try moc.save()
        } catch {
            NSLog("Error saving entry: \(error)")
        }
    }
    
}

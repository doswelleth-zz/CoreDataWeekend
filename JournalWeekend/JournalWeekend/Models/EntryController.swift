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
    
    // MARK: - Save To and Load From Persistent Store
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
            let fetch = try moc.fetch(fetchRequest)
            return fetch
        } catch {
            NSLog("Error fetching entries: \(error)")
        }
        return []
    }
    
    // MARK: - CRUD
    
    func create(title: String, bodyText: String, mood: String) {
        
        let entry = Entry(title: title, bodyText: bodyText, mood: mood)
        entry.title = title
        entry.bodyText = bodyText
        entry.mood = mood
        
        saveToPersistentStore()
    }
    
    func update(entry: Entry, title: String, bodyText: String, mood: String) {
        let scratch = entry
        
        scratch.title = title
        scratch.bodyText = bodyText
        scratch.timestamp = Date()
        scratch.mood = mood
       
        saveToPersistentStore()
    }
    
    func delete(entry: Entry) {
        moc.delete(entry)
        saveToPersistentStore()
    }
    
}

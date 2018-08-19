//
//  Entry+Convenience.swift
//  JournalWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/19/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation
import CoreData

extension Entry {
    
    // MARK: - Set the value of attributes you defined in the data model using the parameters of the initializer.
    
    convenience init(title: String, bodyText: String, identifier: String = UUID().uuidString, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.identifier = identifier
        self.timestamp = timestamp
    }
}

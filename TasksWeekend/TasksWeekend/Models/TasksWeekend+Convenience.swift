//
//  TasksWeekend+Convenience.swift
//  TasksWeekend
//
//  Created by Lambda-School-Loaner-11 on 8/18/18.
//  Copyright © 2018 David Doswell. All rights reserved.
//

import Foundation
import CoreData

extension TasksWeekend {
    convenience init(name: String, notes: String? = nil, context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        
        // MARK: - TasksWeekend Designated Initializer
        self.init(context: context)
        self.name = name
        self.notes = notes
    }
}

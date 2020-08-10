//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Clean Mac on 8/5/20.
//  Copyright © 2020 LambdaStudent. All rights reserved.
//

import Foundation
import CoreData

enum Mood: String, CaseIterable{
    case 🙁
    case 😐
    case 🙂
}
extension Entry {
    @discardableResult convenience init(title: String,
                                        bodyText: String,
                                        timestamp: Date,
                                        identifier: String,
                                        mood: Mood = .😐,
                                        context: NSManagedObjectContext = CoreDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier = identifier
        self.mood = mood.rawValue
    }
}


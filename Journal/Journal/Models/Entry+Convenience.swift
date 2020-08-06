//
//  Entry+Convenience.swift
//  Journal
//
//  Created by Clean Mac on 8/5/20.
//  Copyright © 2020 LambdaStudent. All rights reserved.
//

import Foundation
import CoreData

extension Journal {
    @discardableResult Convenience init(title: String,
                                        bodyText: String,
                                        timestamp: Date,
                                        identifier: String,
                                        context: NSManagedObjectContext = CodeDataStack.shared.mainContext) {
        self.init(context: context)
        self.title = title
        self.bodyText = bodyText
        self.timestamp = timestamp
        self.identifier =identifier
    }
}

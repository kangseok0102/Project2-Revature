//
//  Choices+CoreDataProperties.swift
//  
//
//  Created by Edward Guilllermo on 5/14/21.
//
//

import Foundation
import CoreData


extension Choices {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Choices> {
        return NSFetchRequest<Choices>(entityName: "Choices")
    }

    @NSManaged public var choiceText: [String]?
    @NSManaged public var isCorrect: [Bool]?
    @NSManaged public var question: Questions?

}

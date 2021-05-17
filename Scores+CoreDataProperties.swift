//
//  Scores+CoreDataProperties.swift
//  
//
//  Created by Kangseok Lee on 5/17/21.
//
//

import Foundation
import CoreData


extension Scores {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Scores> {
        return NSFetchRequest<Scores>(entityName: "Scores")
    }

    @NSManaged public var correctAnswers: Int64
    @NSManaged public var totalQuestions: Int64
    @NSManaged public var scores: Categories?

}

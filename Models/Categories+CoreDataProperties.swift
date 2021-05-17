//
//  Categories+CoreDataProperties.swift
//  
//
//  Created by Edward Guilllermo on 5/16/21.
//
//

import Foundation
import CoreData


extension Categories {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Categories> {
        return NSFetchRequest<Categories>(entityName: "Categories")
    }

    @NSManaged public var name: String?
    @NSManaged public var totalQuestions: Int64
    @NSManaged public var categoryDescription: String?
    @NSManaged public var categories: Questions?

}

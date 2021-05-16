//
//  Categories+CoreDataProperties.swift
//  
//
//  Created by Edward Guilllermo on 5/12/21.
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
    @NSManaged public var categoryID: NSSet?

}

// MARK: Generated accessors for categoryID
extension Categories {

    @objc(addCategoryIDObject:)
    @NSManaged public func addToCategoryID(_ value: Questions)

    @objc(removeCategoryIDObject:)
    @NSManaged public func removeFromCategoryID(_ value: Questions)

    @objc(addCategoryID:)
    @NSManaged public func addToCategoryID(_ values: NSSet)

    @objc(removeCategoryID:)
    @NSManaged public func removeFromCategoryID(_ values: NSSet)

}

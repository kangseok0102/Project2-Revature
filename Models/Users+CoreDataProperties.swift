//
//  Users+CoreDataProperties.swift
//  
//
//  Created by Edward Guilllermo on 5/14/21.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var isBlocked: Bool
    @NSManaged public var isSubscribed: Bool
    @NSManaged public var password: String?
    @NSManaged public var ranking: Int64
    @NSManaged public var username: String?
    @NSManaged public var userID: NSSet?

}

// MARK: Generated accessors for userID
extension Users {

    @objc(addUserIDObject:)
    @NSManaged public func addToUserID(_ value: Scores)

    @objc(removeUserIDObject:)
    @NSManaged public func removeFromUserID(_ value: Scores)

    @objc(addUserID:)
    @NSManaged public func addToUserID(_ values: NSSet)

    @objc(removeUserID:)
    @NSManaged public func removeFromUserID(_ values: NSSet)

}

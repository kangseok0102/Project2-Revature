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
    @NSManaged public var userScores: Scores?

}

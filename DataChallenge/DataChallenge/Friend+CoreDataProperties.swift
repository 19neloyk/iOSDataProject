//
//  Friend+CoreDataProperties.swift
//  DataChallenge
//
//  Created by Neloy Kundu on 6/8/20.
//  Copyright © 2020 Neloy Kundu. All rights reserved.
//
//

import Foundation
import CoreData


extension Friend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Friend> {
        return NSFetchRequest<Friend>(entityName: "Friend")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: Person?

}

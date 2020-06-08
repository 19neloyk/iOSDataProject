//
//  Acquaintance+CoreDataProperties.swift
//  DataChallenge
//
//  Created by Neloy Kundu on 6/8/20.
//  Copyright © 2020 Neloy Kundu. All rights reserved.
//
//

import Foundation
import CoreData


extension Acquaintance {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Acquaintance> {
        return NSFetchRequest<Acquaintance>(entityName: "Acquaintance")
    }

    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var origin: Person?
    
    public var wrappedName : String {
        return name ?? "Unknown Name"
    }
    
    public var wrappedId : String {
        return id ?? "Unknown ID"
    }

}

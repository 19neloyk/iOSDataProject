//
//  Person+CoreDataProperties.swift
//  DataChallenge
//
//  Created by Neloy Kundu on 6/8/20.
//  Copyright © 2020 Neloy Kundu. All rights reserved.
//
//

import Foundation
import CoreData


extension Person {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Person> {
        return NSFetchRequest<Person>(entityName: "Person")
    }

    @NSManaged public var about: String?
    @NSManaged public var company: String?
    @NSManaged public var id: String?
    @NSManaged public var name: String?
    @NSManaged public var acquaintance: NSSet?
    
    public var wrappedName : String {
        return name ?? "Unknown Name"
    }
    
    public var wrappedCompany : String {
        return company ?? "Unknown Company"
    }
    
    public var wrappedAbout : String {
        return about ?? "Unknown About"
    }
    
    public var wrappedId : String {
        return id ?? "Unknown ID"
    }
    
    public var acquaintanceArray: [Acquaintance] {
        let set  = acquaintance as? Set<Acquaintance> ?? []
        
        return set.sorted {
            $0.wrappedName < $1.wrappedName
        }
    }

}

// MARK: Generated accessors for acquaintance
extension Person {

    @objc(addAcquaintanceObject:)
    @NSManaged public func addToAcquaintance(_ value: Acquaintance)

    @objc(removeAcquaintanceObject:)
    @NSManaged public func removeFromAcquaintance(_ value: Acquaintance)

    @objc(addAcquaintance:)
    @NSManaged public func addToAcquaintance(_ values: NSSet)

    @objc(removeAcquaintance:)
    @NSManaged public func removeFromAcquaintance(_ values: NSSet)

}

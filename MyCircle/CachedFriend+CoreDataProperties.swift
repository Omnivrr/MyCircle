//
//  CachedFriend+CoreDataProperties.swift
//  MyCircle
//
//  Created by Bukhari Sani on 16/07/2023.
//
//

import Foundation
import CoreData


extension CachedFriend {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CachedFriend> {
        return NSFetchRequest<CachedFriend>(entityName: "CachedFriend")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var user: CachedUser?

    var wrappedName: String {
        name ?? ""
    }
}

extension CachedFriend : Identifiable {

}

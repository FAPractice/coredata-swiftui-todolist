//
//  Item+CoreDataProperties.swift
//  TodoList
//
//  Created by Harsh Chaturvedi on 30/03/22.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var text: String?
    @NSManaged public var completed: Bool
    @NSManaged public var id: UUID?

    var unwrappedText: String {
        text ?? "Unknown Text"
    }
}

extension Item : Identifiable {

}

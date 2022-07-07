//
//  Expense+CoreDataProperties.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/07.
//
//

import Foundation
import CoreData


extension Expense {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Expense> {
        return NSFetchRequest<Expense>(entityName: "Expense")
    }

    @NSManaged public var price: Int64

}

extension Expense : Identifiable {

}

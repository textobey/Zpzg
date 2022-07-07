//
//  PersistenceManager.swift
//  Zpzg
//
//  Created by 이서준 on 2022/07/07.
//

import Foundation
import CoreData

class PersistenceManager {
    static let shared: PersistenceManager = PersistenceManager()
    
    // MARK: - Basic Setup
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "Expense")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    // MARK: - CRUD
    func create(model: Spending) -> Void {
        let expense = Expense(context: context)
        
        expense.price = model.price
        
        do {
            try self.context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func read() -> [Spending] {
        let readRequest = NSFetchRequest<NSManagedObject>(entityName: "Expense")
        let spendingData = try! context.fetch(readRequest)
        
        var dataToSpending = [Spending]()
        
        for data in spendingData {
            let price = data.value(forKey: "price") as! Int64
            
            dataToSpending.append(Spending(price: price))
        }
        
        return dataToSpending
    }
}

struct Spending {
    //let title: String
    let price: Int64
    //let memo: String?
}

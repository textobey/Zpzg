//
//  AppDelegate.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit
import CoreData
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    // MARK: - Application LifeCycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupIQKeyboardManager()
        setupRootViewController()
        return true
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        saveContext()
    }
    
    private func setupRootViewController() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(MainViewController(), animated: true)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
    }
    
    private func setupIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.enableAutoToolbar = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }
    
    // MARK: - Core Data stack
    // Core Data에서 정보를 저장하고 검색하는 것을 쉽게 해주는 객체들의 집합
     lazy var persistentContainer: NSPersistentContainer = {
         /*
          The persistent container for the application. This implementation
          creates and returns a container, having loaded the store for the
          application to it. This property is optional since there are legitimate
          error conditions that could cause the creation of the store to fail.
         */
         // NSPersistentContainer(name: "xcdatamodeld 파일 이름")
         let container = NSPersistentContainer(name: "Expense")
         container.loadPersistentStores(completionHandler: { (storeDescription, error) in
             if let error = error as NSError? {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                  
                 /*
                  Typical reasons for an error here include:
                  * The parent directory does not exist, cannot be created, or disallows writing.
                  * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                  * The device is out of space.
                  * The store could not be migrated to the current model version.
                  Check the error message to determine what the actual problem was.
                  */
                 fatalError("Unresolved error \(error), \(error.userInfo)")
             }
         })
         return container
     }()

     // MARK: - Core Data Saving support

     func saveContext () {
         let context = persistentContainer.viewContext
         if context.hasChanges {
             do {
                 try context.save()
             } catch {
                 // Replace this implementation with code to handle the error appropriately.
                 // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                 let nserror = error as NSError
                 fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
             }
         }
     }
}


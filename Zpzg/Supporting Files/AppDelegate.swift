//
//  AppDelegate.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let navigationController = UINavigationController()
        navigationController.navigationBar.prefersLargeTitles = true
        navigationController.pushViewController(MainViewController(), animated: true)
        window?.makeKeyAndVisible()
        window?.rootViewController = navigationController
        return true
    }
}


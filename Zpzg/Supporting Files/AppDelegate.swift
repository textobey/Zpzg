//
//  AppDelegate.swift
//  Zpzg
//
//  Created by 이서준 on 2022/06/23.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupRootViewController()
        setupIQKeyboardManager()
        return true
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
}


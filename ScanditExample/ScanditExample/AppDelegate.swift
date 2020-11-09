//
//  AppDelegate.swift
//  ScanditExample
//
//  Created by TRINHNT12 on 11/7/20.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let navigation = UINavigationController(rootViewController: RootViewController())
        navigation.navigationBar.isTranslucent = false
        window?.rootViewController = navigation
        return true
    }
}


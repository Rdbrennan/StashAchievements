//
//  AppDelegate.swift
//  StashAchievements
//
//  Created by Robert Brennan on 2/11/21.
//

import UIKit
import CoreData

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        navigateToRootVC()
        
        return true
    }
    private func navigateToRootVC() {
        let achievements = AchievementsRouter.createModule()
        let rootNav = UINavigationController(rootViewController: achievements)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = rootNav
        window?.makeKeyAndVisible()
    }
}


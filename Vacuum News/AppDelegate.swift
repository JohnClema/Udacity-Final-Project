//
//  AppDelegate.swift
//  Vacuum News
//
//  Created by John Clema on 9/4/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    let dataStack = CoreDataStackManager(modelName: "Model")!

    private func initialiseUI() {
        let todayViewController = PictureOfTheDayViewController()
        todayViewController.extendedLayoutIncludesOpaqueBars = true
        todayViewController.navigationItem.largeTitleDisplayMode = .always
        todayViewController.title = "Today's Picture"
        let todayNavigationController = UINavigationController(rootViewController: todayViewController)

        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = todayNavigationController
        self.window?.makeKeyAndVisible()
    }

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        initialiseUI()
        return true
    }
}


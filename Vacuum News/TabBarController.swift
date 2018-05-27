//
//  TabBarController.swift
//  Vacuum News
//
//  Created by John Clema on 24/5/18.
//  Copyright © 2018 John Clema. All rights reserved.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.tabBar.barTintColor = UIColor.white
        self.tabBar.isTranslucent = true
        let todayViewController = PictureOfTheDayViewController()
        todayViewController.title = "Today's Picture"
        todayViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 0)
        todayViewController.extendedLayoutIncludesOpaqueBars = true

        let settingsViewController = SettingsViewController()
        settingsViewController.title = "Settings"
        settingsViewController.tabBarItem =  UITabBarItem(tabBarSystemItem: .more, tag: 2)
        settingsViewController.extendedLayoutIncludesOpaqueBars = true

        
        let todayNavigationController = UINavigationController(rootViewController: todayViewController)
        let settingsNavigationController = UINavigationController(rootViewController: settingsViewController)
        self.setViewControllers([todayNavigationController, settingsNavigationController], animated: false)
    }
}

//
//  TabBarController.swift
//  WoltK
//
//  Created by Kairat on 7/17/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        settingsTabBarItems()
    }
    
    func settingsTabBarItems() {
        let beauty = UINavigationController(rootViewController: BeautyController())
        let beautyTabBarItem = UITabBarItem(title: "Beauty", image: nil, tag: 1)
        beauty.tabBarItem = beautyTabBarItem
        
        let search = SearchViewController()
        let searchTabBarItem = UITabBarItem(title: "Search", image: nil, tag: 2)
        search.tabBarItem = searchTabBarItem
        
        let profileController = ProfileCordinator(nibName: nil, bundle: nil)
        
        let profileTabBarItem = UITabBarItem(title: "Profile", image: nil, tag: 3)
        profileController.tabBarItem = profileTabBarItem
        
        let testController = TestingViewController()
        let testTabBarItem = UITabBarItem(title: "Test", image: nil, tag: 4)
        testController.tabBarItem = testTabBarItem
        
        self.viewControllers = [beauty, search, profileController, testController]
    }
}


//
//  ProfileNavigationController.swift
//  WoltK
//
//  Created by Kairat on 9/7/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class ProfileCordinator: UINavigationController {
    
    func isUserDefault()-> Bool {
        return UserDefaults.standard.bool(forKey: "IsLoginedIn")
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        if isUserDefault() {
            profileSetup()
        } else {
            loginSetup()
        }
    }
    
    private func loginSetup() {
        let loginViewController = LoginViewController()
        pushViewController(loginViewController, animated: true)
    }
    
    private func profileSetup() {
        let profileViewController = ProfileViewController()
        pushViewController(profileViewController, animated: true)
    }
}

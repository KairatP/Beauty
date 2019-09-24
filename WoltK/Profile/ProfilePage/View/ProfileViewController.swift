//
//  ProfileViewController.swift
//  WoltK
//
//  Created by Kairat on 7/17/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
}


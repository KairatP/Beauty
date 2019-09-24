//
//  LoginTableViewCell.swift
//  WoltK
//
//  Created by Kairat on 9/5/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

protocol LoginCellDelagate {
    func delegate()
}

class LoginTableViewCell: UITableViewCell {
    
    var delagate: LoginCellDelagate?
    
    let loginButton: UIButton = {
       let button = UIButton(type: .system)
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .orange
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        [loginButton.topAnchor.constraint(equalTo: self.topAnchor),
         loginButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         loginButton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         loginButton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ].forEach { $0.isActive = true }
        
        loginButton.addTarget(self, action: #selector(handleLogin), for: .touchUpInside)
    }
    
    @objc func handleLogin() {
        delagate?.delegate()
    }
}

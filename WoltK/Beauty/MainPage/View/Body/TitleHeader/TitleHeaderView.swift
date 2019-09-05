//
//  TitleHeaderView.swift
//  WoltK
//
//  Created by Kairat on 7/30/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TitleHeaderView: UIView {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        label.text = "Test"
        return label
    }()
    
    let titleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See all", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitleColor(#colorLiteral(red: 0.1576684117, green: 0.4022570252, blue: 0.9797011018, alpha: 1), for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(titleLable)
        addSubview(titleButton)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        [titleLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
         titleLable.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
         titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            titleLable.trailingAnchor.constraint(lessThanOrEqualTo: titleButton.trailingAnchor, constant: -100)
            ].forEach { $0.isActive = true }
        
        titleButton.translatesAutoresizingMaskIntoConstraints = false
        [titleButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4),
         titleButton.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
         titleButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
    }
}

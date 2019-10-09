//
//  TestCell.swift
//  WoltK
//
//  Created by Kairat on 10/5/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {
        
        
        let priceLabel: UILabel = {
            let label = UILabel()
            label.backgroundColor = .blue
            label.font = .systemFont(ofSize: 22)
            label.textColor = #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
            return label
        }()
        
        override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            setupView()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        func setupView() {
            addSubview(priceLabel)
            
            
            priceLabel.translatesAutoresizingMaskIntoConstraints = false
            [priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
             priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
             priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
             priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
             priceLabel.heightAnchor.constraint(equalToConstant: 100)
                ].forEach { $0.isActive = true }
        }
    }

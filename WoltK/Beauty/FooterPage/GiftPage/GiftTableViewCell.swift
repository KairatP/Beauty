//
//  GiftTableViewCell.swift
//  WoltK
//
//  Created by Kairat on 9/12/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class GiftTableViewCell: UITableViewCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 22)
        label.textColor = #colorLiteral(red: 0.9372549057, green: 0.3490196168, blue: 0.1921568662, alpha: 1)
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
        addSubview(nameLabel)
        addSubview(priceLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        [nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
         nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
         nameLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         nameLabel.trailingAnchor.constraint(equalTo: priceLabel.leadingAnchor, constant: 10),
         nameLabel.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width / 2)
            ].forEach { $0.isActive = true }
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        [priceLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 20),
         priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
         priceLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
    }
    
    func cellData(model: GiftModel) {
        nameLabel.text = model.sertificateName
        priceLabel.text = model.sertifcatePrice
    }
    
}

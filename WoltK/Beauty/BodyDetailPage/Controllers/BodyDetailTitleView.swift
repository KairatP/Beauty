//
//  BodyDetailTitleView.swift
//  WoltK
//
//  Created by Kairat on 9/12/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailTitleView: UIView {
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34)
        label.textAlignment = .left
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let raitingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        return label
    }()
    
    let raitingImage: UIImageView = {
        let image = UIImageView()
        return image
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
        addSubview(priceLabel)
        addSubview(raitingImage)
        addSubview(raitingLabel)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        [titleLable.bottomAnchor.constraint(equalTo: raitingImage.topAnchor, constant: -14),
         titleLable.topAnchor.constraint(equalTo: self.topAnchor),
         titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         titleLable.trailingAnchor.constraint(lessThanOrEqualTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        [priceLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 14),
         priceLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
         priceLabel.heightAnchor.constraint(equalToConstant: 30),
         priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         priceLabel.trailingAnchor.constraint(equalTo: raitingImage.leadingAnchor)
            ].forEach { $0.isActive = true }
        
        raitingImage.translatesAutoresizingMaskIntoConstraints = false
        [raitingImage.bottomAnchor.constraint(equalTo: self.bottomAnchor,constant: -14),
         raitingImage.widthAnchor.constraint(equalToConstant: 30),
         raitingImage.heightAnchor.constraint(equalToConstant: 30),
            ].forEach { $0.isActive = true }
        
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        [raitingLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 14),
         raitingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
         raitingLabel.leadingAnchor.constraint(equalTo: raitingImage.trailingAnchor, constant: 14),
         raitingLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         raitingLabel.widthAnchor.constraint(equalToConstant: 45),
         raitingLabel.heightAnchor.constraint(equalToConstant: 30)
            ].forEach { $0.isActive = true }
    }
    
    func headerData(price: String, raiting: String, raitingImage: Bool) {
        priceLabel.text = "$ \(price)"
        raitingLabel.text = raiting
        self.raitingImage.image = raitingImage ? UIImage(named: "good") : UIImage(named: "bad")
    }
}

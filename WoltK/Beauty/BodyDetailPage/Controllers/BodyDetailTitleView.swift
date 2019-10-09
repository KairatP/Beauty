//
//  BodyDetailTitleView.swift
//  WoltK
//
//  Created by Kairat on 9/12/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailTitleView: UIView {
    
    var showViewClosure: (() -> Void)?
    
    let titleLable: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 34)
        label.textAlignment = .center
        label.textColor = #colorLiteral(red: 0.05882352963, green: 0.180392161, blue: 0.2470588237, alpha: 1)
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textColor = #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)
        return label
    }()
    
    let raitingLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return label
    }()
    
    let raitingImage: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5646627545, blue: 1, alpha: 1)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Add to Cart", for: .normal)
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
        addSubview(buyButton)
        addSubview(titleLable)
        addSubview(priceLabel)
        addSubview(raitingImage)
        addSubview(raitingLabel)
        
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        [titleLable.topAnchor.constraint(equalTo: self.topAnchor),
         titleLable.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         titleLable.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        [buyButton.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
         buyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         buyButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
         buyButton.widthAnchor.constraint(equalToConstant: 140)
            ].forEach { $0.isActive = true }
        
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        [priceLabel.topAnchor.constraint(equalTo: titleLable.bottomAnchor),
         priceLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         priceLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -4)
            ].forEach { $0.isActive = true }
        
        raitingImage.translatesAutoresizingMaskIntoConstraints = false
        [raitingImage.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
         raitingImage.bottomAnchor.constraint(greaterThanOrEqualTo: self.bottomAnchor, constant: 0),
         raitingImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         raitingImage.widthAnchor.constraint(equalToConstant: 20),
         raitingImage.heightAnchor.constraint(equalToConstant: 20),
            ].forEach { $0.isActive = true }
        
        raitingLabel.translatesAutoresizingMaskIntoConstraints = false
        [raitingLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 4),
         raitingLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         raitingLabel.leadingAnchor.constraint(equalTo: raitingImage.trailingAnchor, constant: 14),
         raitingLabel.trailingAnchor.constraint(equalTo: buyButton.leadingAnchor, constant: -4)
            ].forEach { $0.isActive = true }
        
        buyButton.addTarget(self, action: #selector(cartAction), for: .touchUpInside)
    }
    
    @objc func cartAction() {
        showViewClosure?()
    }
    
    func headerData(price: String, raiting: String, raitingImage: Bool) {
        priceLabel.text = "Price \(price)$"
        raitingLabel.text = raiting
        self.raitingImage.image = raitingImage ? UIImage(named: "good") : UIImage(named: "bad")
    }
}

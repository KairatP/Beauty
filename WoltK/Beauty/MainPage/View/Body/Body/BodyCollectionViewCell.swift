//
//  BodyCollectionViewCell.swift
//  WoltK
//
//  Created by Kairat on 7/29/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyCollectionViewCell: UICollectionViewCell {
    
    let view: UIView = {
        let view = UIView()
        return view
    }()
    
    let image: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let typeLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    let nameLable: UILabel = {
        let lable = UILabel()
        return lable
    }()
    
    let priceLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12.0)
        lable.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        return lable
    }()
    
    let ratingSymbol: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    let ratingLable: UILabel = {
        let lable = UILabel()
        lable.font = UIFont.systemFont(ofSize: 12.0)
        lable.textColor = #colorLiteral(red: 0.370555222, green: 0.3705646992, blue: 0.3705595732, alpha: 1)
        return lable
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(view)
        view.addSubview(image)
        view.addSubview(typeLable)
        view.addSubview(nameLable)
        view.addSubview(priceLable)
        view.addSubview(ratingSymbol)
        view.addSubview(ratingLable)
        
        view.translatesAutoresizingMaskIntoConstraints = false
        [view.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
         view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
         view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
         view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0)
            ].forEach { $0.isActive = true}
        
        image.translatesAutoresizingMaskIntoConstraints = false
        [image.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
         image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
         image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
         image.heightAnchor.constraint(equalToConstant: 110)
            ].forEach { $0.isActive = true }
        
        typeLable.translatesAutoresizingMaskIntoConstraints = false
        [typeLable.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 5),
         typeLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
         typeLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
         typeLable.heightAnchor.constraint(equalToConstant: 20)
            ].forEach { $0.isActive = true }
        
        nameLable.translatesAutoresizingMaskIntoConstraints = false
        [nameLable.topAnchor.constraint(equalTo: typeLable.bottomAnchor, constant: 5),
         nameLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
         nameLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
         nameLable.heightAnchor.constraint(equalToConstant: 20)
            ].forEach { $0.isActive = true }
        
        priceLable.translatesAutoresizingMaskIntoConstraints = false
        [priceLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10),
         priceLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 4),
         priceLable.trailingAnchor.constraint(equalTo: ratingSymbol.leadingAnchor, constant: -4),
         priceLable.heightAnchor.constraint(equalToConstant: 18)
            ].forEach { $0.isActive = true }
        
        ratingSymbol.translatesAutoresizingMaskIntoConstraints = false
        [ratingSymbol.centerYAnchor.constraint(equalTo: ratingLable.centerYAnchor),
         ratingSymbol.trailingAnchor.constraint(equalTo: ratingLable.leadingAnchor, constant: -3),
         ratingSymbol.heightAnchor.constraint(equalToConstant: 14),
         ratingSymbol.widthAnchor.constraint(equalToConstant: 14)
            ].forEach { $0.isActive = true }
        
        ratingLable.translatesAutoresizingMaskIntoConstraints = false
        [ratingLable.topAnchor.constraint(equalTo: nameLable.bottomAnchor, constant: 10),
         ratingLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -4),
         ratingLable.heightAnchor.constraint(equalToConstant: 18),
         ratingLable.widthAnchor.constraint(equalToConstant: 50)
            ].forEach { $0.isActive = true }
    }
    
    func setupData(model: GoodsModel) {
        self.image.image = UIImage(named: model.image)
        typeLable.text = model.type
        nameLable.text = model.name
        priceLable.text = "$ \(model.price)"
        ratingSymbol.image = model.ratingStatus ? UIImage(named: "good") : UIImage(named: "bad")
        ratingLable.text = model.rating
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layer.cornerRadius = 5
        clipsToBounds = true
        layer.borderWidth = 1
        layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
    }
}

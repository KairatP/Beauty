//
//  OrderView.swift
//  WoltK
//
//  Created by Kairat on 9/26/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class OrderView: UIView {
    
    let buyButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Buy now", for: .normal)
        return button
    }()
    
    let cartButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = #colorLiteral(red: 0, green: 0.5647058824, blue: 1, alpha: 1)
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.setTitle("Add to Cart", for: .normal)
        return button
    }()
    
    let oneView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(white: 0, alpha: 0)
        return view
    }()
    
    let stepperLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    let stepper: UIStepper = {
        let stepper = UIStepper()
        stepper.value = 1
        stepper.minimumValue = 1
        stepper.maximumValue = .infinity
        return stepper
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.9880844951, green: 0.9563996196, blue: 0.9143809676, alpha: 1)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(buyButton)
        addSubview(cartButton)
        addSubview(oneView)
        
        cartButton.translatesAutoresizingMaskIntoConstraints = false
        [cartButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 21),
         cartButton.heightAnchor.constraint(equalToConstant: 45),
         cartButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
         cartButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
        
        buyButton.translatesAutoresizingMaskIntoConstraints = false
        [buyButton.widthAnchor.constraint(equalToConstant: (UIScreen.main.bounds.width / 2) - 21),
         buyButton.heightAnchor.constraint(equalToConstant: 45),
         buyButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 5),
         buyButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14)
            ].forEach { $0.isActive = true }
        
        oneView.translatesAutoresizingMaskIntoConstraints = false
        [oneView.topAnchor.constraint(equalTo: buyButton.bottomAnchor),
         oneView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         oneView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         oneView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor)
            ].forEach { $0.isActive = true }
        
        oneView.addSubview(stepperLabel)
        oneView.addSubview(stepper)
        stepperLabel.text = String(stepper.value)
        
        stepperLabel.translatesAutoresizingMaskIntoConstraints = false
        [stepperLabel.topAnchor.constraint(equalTo: oneView.topAnchor, constant: 4),
         stepperLabel.trailingAnchor.constraint(equalTo: oneView.trailingAnchor, constant: -14),
         stepperLabel.heightAnchor.constraint(equalToConstant: 50)
            ].forEach { $0.isActive = true }
        
    }
}

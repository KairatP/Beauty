//
//  FooterView.swift
//  WoltK
//
//  Created by Kairat on 8/26/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class FooterView: UIView {
    
    var footerColsure: (() -> Void)?
    
    let buton: UIButton = {
        let buton = UIButton()
        buton.setTitle("Gifts", for: .normal)
        buton.titleLabel?.font = UIFont.systemFont(ofSize: 32)
        buton.setTitleColor(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1), for: .normal)
        buton.titleLabel?.textAlignment = .center
        return buton
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(buton)
        buton.translatesAutoresizingMaskIntoConstraints = false
        [buton.topAnchor.constraint(equalTo: self.topAnchor),
         buton.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         buton.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         buton.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ].forEach { $0.isActive = true }
        buton.addTarget(self, action: #selector(footerAction), for: .touchUpInside)
    }
    
    @objc func footerAction() {
        footerColsure?()
    }
}

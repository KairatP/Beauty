//
//  DHeaderView.swift
//  WoltK
//
//  Created by Kairat on 8/19/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class DHeaderView: UIView {
    
    var headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.backgroundColor = .orange
        image.image = UIImage(named: "1")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        setupView()
    }
    
    func setupView() {
        addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        [headerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor)
            ].forEach { $0.isActive = true }
        [headerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor).identifier = "botom"].first
        [headerImage.heightAnchor.constraint(equalToConstant: self.frame.height).identifier = "height"].first
        
        //        headerImage.image = UIImage(named: )
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

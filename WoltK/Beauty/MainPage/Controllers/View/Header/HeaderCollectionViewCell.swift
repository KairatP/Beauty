//
//  HeaderCollectionViewCell.swift
//  WoltK
//
//  Created by Kairat on 7/31/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderCollectionViewCell: UICollectionViewCell {
    
    var headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 10
        image.clipsToBounds = true
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func viewSetup() {
        addSubview(headerImage)
        
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        [headerImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         headerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -18),
         headerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
         headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14)
            ].forEach { $0.isActive = true }
    }
    
    func headerData(image: String) {
        headerImage.image = UIImage(named: image)
    }
}

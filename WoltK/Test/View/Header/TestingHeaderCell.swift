//
//  TestingHeaderCell.swift
//  WoltK
//
//  Created by Kairat on 9/3/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TestingHeaderCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//
//  GiftBableView.swift
//  WoltK
//
//  Created by Kairat on 9/12/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class GiftTableView: UITableView {
    
    var height: NSLayoutConstraint?
    var bottom: NSLayoutConstraint?
    let giftHeaderView = GiftHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.59))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        tableHeaderView = giftHeaderView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Paralax
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let offsetY = -contentOffset.y
        
        if let imageView = giftHeaderView.subviews.first as? UIImageView {
            imageView.constraints.forEach { (constraint) in
                if constraint.firstAttribute == .height {
                    constraint.constant = max(giftHeaderView.bounds.height, giftHeaderView.bounds.height + offsetY)
                }
            }
        }
    }
}

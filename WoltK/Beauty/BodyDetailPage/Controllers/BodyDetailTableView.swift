//
//  BBodyDetailTableView.swift
//  WoltK
//
//  Created by Kairat on 9/2/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailTableView: UITableView {
    
    var height: NSLayoutConstraint?
    var bottom: NSLayoutConstraint?
    let bodyHeaderView = BodyDetailHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.59))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        tableHeaderView = bodyHeaderView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Paralax
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let offsetY = -contentOffset.y
        
        if let imageView = bodyHeaderView.subviews.first as? UIImageView {
            imageView.constraints.forEach { (constraint) in
                if constraint.firstAttribute == .height {
                    constraint.constant = max(bodyHeaderView.bounds.height, bodyHeaderView.bounds.height + offsetY)
                }
            }
        }
    }
}

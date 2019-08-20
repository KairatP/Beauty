//
//  HearedDetailTableView.swift
//  WoltK
//
//  Created by Kairat on 8/20/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderDetailTableView: UITableView {
    
    var height: NSLayoutConstraint?
    var bottom: NSLayoutConstraint?
    let headerView = DHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.70))
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        
           tableHeaderView = headerView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if let imageView = headerView.subviews.first as? UIImageView {
            height = imageView.constraints.filter{ $0.identifier == "height" }.first
            bottom = headerView.constraints.filter{ $0.identifier == "botom" }.first
        }
        let offsetY = -contentOffset.y
        height?.constant = max(headerView.bounds.height, headerView.bounds.height + offsetY)
    }
}

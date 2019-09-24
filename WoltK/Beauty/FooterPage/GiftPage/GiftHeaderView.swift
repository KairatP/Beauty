//
//  GiftHeaderView.swift
//  WoltK
//
//  Created by Kairat on 9/12/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class GiftHeaderView: UIView {
    var headerImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    var animator: UIViewPropertyAnimator!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .green
        setupView()
    }
    
    func setupView() {
        addSubview(headerImage)
        headerImage.translatesAutoresizingMaskIntoConstraints = false
        [headerImage.trailingAnchor.constraint(equalTo: self.trailingAnchor),
         headerImage.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         headerImage.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         headerImage.heightAnchor.constraint(equalToConstant: self.frame.height)
            ].forEach { $0.isActive = true }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func paralaxImage(imageName: String) {
        headerImage.image = UIImage(named: imageName)
    }
    
    func setupVisualBlureEffect() {
        animator = UIViewPropertyAnimator(duration: 3.0, curve: .linear, animations: {
            let blureEffect = UIBlurEffect(style: .regular)
            let visualEffectView = UIVisualEffectView(effect: blureEffect)
            
            self.addSubview(visualEffectView)
        })
    }
}



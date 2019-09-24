//
//  HeaderDetailTitleView.swift
//  WoltK
//
//  Created by Kairat on 9/17/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderDetailTitleView: UIView {
    
    let intruductionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        intruductionTextView.backgroundColor = .red
        addSubview(intruductionTextView)
        intruductionTextView.translatesAutoresizingMaskIntoConstraints = false
        [intruductionTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         intruductionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
         intruductionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         intruductionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
    }
}

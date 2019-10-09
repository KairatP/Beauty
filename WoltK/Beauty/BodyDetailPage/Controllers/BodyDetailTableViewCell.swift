//
//  BodyDetailTableViewCell.swift
//  WoltK
//
//  Created by Kairat on 9/10/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailTableViewCell: UITableViewCell {
    
    let introductionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.textColor = #colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)
        textView.isEditable = false
        textView.sizeToFit()
        textView.isScrollEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(introductionTextView)
        
        introductionTextView.translatesAutoresizingMaskIntoConstraints = false
        [introductionTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 14),
         introductionTextView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14),
         introductionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         introductionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
    }
    
}

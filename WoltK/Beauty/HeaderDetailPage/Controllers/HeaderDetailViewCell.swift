//
//  HeaderDetailViewCell.swift
//  WoltK
//
//  Created by Kairat on 8/19/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderDetailViewCell: UITableViewCell {
    
    var textImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    let intruductionTextView: UITextView = {
        let textView = UITextView()
        textView.font = .systemFont(ofSize: 18)
        textView.sizeToFit()
        textView.isScrollEnabled = false
        textView.isEditable = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setupView() {
        
        addSubview(intruductionTextView)
        intruductionTextView.translatesAutoresizingMaskIntoConstraints = false
        [intruductionTextView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
         intruductionTextView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         intruductionTextView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14)
            ].forEach { $0.isActive = true }
        
        addSubview(textImage)
        textImage.translatesAutoresizingMaskIntoConstraints = false
        [
            textImage.topAnchor.constraint(equalTo: intruductionTextView.bottomAnchor, constant: 20),
         textImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20),
         textImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         textImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -14),
         textImage.heightAnchor.constraint(equalToConstant: 200)
            ].forEach { $0.isActive = true }
    }
    
    func cellInfo(text: String, imageName: String) {
        intruductionTextView.text = text
        textImage.image = UIImage(named: imageName)
    }
    
}

//
//  TestingHeaderView.swift
//  WoltK
//
//  Created by Kairat on 9/3/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TestingHeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Testing index"
        label.font = UIFont.boldSystemFont(ofSize: 44)
        label.textColor = #colorLiteral(red: 0.2037973404, green: 0.242998749, blue: 0.8529096842, alpha: 1)
        
        return label
    }()
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    let cellID = "cellID"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel.topAnchor.constraint(greaterThanOrEqualTo: self.topAnchor, constant: 0),
         titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
         titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            ].forEach { $0.isActive = true }
        
        addSubview(collectionView)
        collectionView.register(TestingHeaderCell.self, forCellWithReuseIdentifier: cellID)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
         collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         collectionView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.34),
         collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ].forEach { $0.isActive = true }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! TestingHeaderCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indewxPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width * 0.3, height: UIScreen.main.bounds.width * 0.34)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}

//
//  BodyTableViewCell.swift
//  WoltK
//
//  Created by Kairat on 7/26/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

protocol BodyTableViewCellDelegate {
    func didSelectRow(row: Int, category: TypeModel)
}

class BodyTableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {
    
    var delegate: BodyTableViewCellDelegate?
    
    let cellID = "CellID"
    var model: [GoodsModel]?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        collectionView.reloadData()
    }
    
    func setupViews() {
        addSubview(collectionView)
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(BodyCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: self.topAnchor),
         collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ].forEach { $0.isActive = true }
    }
    
    func getInfo(data: [GoodsModel]) {
        model = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! BodyCollectionViewCell
        guard let viewModelData = model else { return UICollectionViewCell() }
        cell.setupData(model: viewModelData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indewxPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height * 0.78, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let viewModelData = model else { return }
        delegate!.didSelectRow(row: indexPath.row, category:viewModelData[indexPath.row].category)
    }
}

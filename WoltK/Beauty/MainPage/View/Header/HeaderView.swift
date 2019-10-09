//
//  HeaderView.swift
//  WoltK
//
//  Created by Kairat on 7/29/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderView: UIView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    let viewModel = BeautyViewModel()
    var timer = Timer()
    var headerIndexPathClosure: ((IndexPath) -> Void)?
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()
    
    let pageController: UIPageControl = {
        let pageController = UIPageControl()
        pageController.currentPage = 0
        pageController.currentPageIndicatorTintColor = .blue
        pageController.pageIndicatorTintColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        return pageController
    }()
    
    let cellID = "CellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        addSubview(collectionView)
        addSubview(pageController)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(HeaderCollectionViewCell.self, forCellWithReuseIdentifier: cellID)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        [collectionView.topAnchor.constraint(equalTo: self.topAnchor),
//         collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
         collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor)
            ].forEach { $0.isActive = true }
        
        pageController.translatesAutoresizingMaskIntoConstraints = false
        [pageController.heightAnchor.constraint(equalToConstant: 10),
         pageController.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 2),
         pageController.bottomAnchor.constraint(equalTo: self.bottomAnchor),
         pageController.centerXAnchor.constraint(equalTo: self.centerXAnchor)
            ].forEach { $0.isActive = true }
        
        pageController.hidesForSinglePage = true
        pageController.numberOfPages = viewModel.numberOfheader
        guard pageController.numberOfPages > 1 else { return }
            timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(imageChange), userInfo: nil, repeats: true)
    }
    
    @objc func imageChange() {
        var nextPage = pageController.currentPage + 1
        var indexPath = IndexPath(item: nextPage, section: 0)
        if nextPage < pageController.numberOfPages {
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = nextPage
        } else {
            nextPage = 0
            indexPath = IndexPath(item: nextPage, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            pageController.currentPage = nextPage
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfheader
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as! HeaderCollectionViewCell
        cell.headerData(image: viewModel.headerInput[indexPath.row].imageName)
        return cell
    }
    
    // -* height insets need check *********************************************
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        print(frame.height, "Height")
        return CGSize(width: frame.width, height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    // MARK: - manual scrollView(cell set with pageController)
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let x = targetContentOffset.pointee.x
        pageController.currentPage = Int(x / collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        headerIndexPathClosure?(indexPath)
    }
}

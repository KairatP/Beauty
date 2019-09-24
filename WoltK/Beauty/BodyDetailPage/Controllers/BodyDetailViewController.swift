//
//  BodyDetailViewController.swift
//  WoltK
//
//  Created by Kairat on 8/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel: BodyViewModel
    let tableView = BodyDetailTableView()
    let cellID = "cellID"
    
    init(viewModel: BodyViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.bodyHeaderView.paralaxImage(imageName: viewModel.model.image)
        tableView.register(BodyDetailTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.tableFooterView = UIView(frame: CGRect.zero)
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].forEach { $0.isActive = true }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleType = viewModel.model.name
        let titleView = BodyDetailTitleView()
        titleView.titleLable.text = titleType
        titleView.headerData(price: viewModel.model.price, raiting: viewModel.model.rating, raitingImage: viewModel.model.ratingStatus)
        return titleView
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! BodyDetailTableViewCell
        cell.introductionTextView.text = viewModel.introduction
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let rowHeight = UITableView.automaticDimension
        return rowHeight
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y / (UIScreen.main.bounds.width * 0.40)
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        if offset > 0 {
            
            navigationController?.navigationBar.backgroundColor = color
        } else {
            navigationController?.navigationBar.backgroundColor = color
        }
    }
}

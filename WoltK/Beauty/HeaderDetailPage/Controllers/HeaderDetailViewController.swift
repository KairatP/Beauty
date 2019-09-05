//
//  HeaderDetailViewController.swift
//  WoltK
//
//  Created by Kairat on 8/5/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class HeaderDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    let viewModel: HeaderViewModel
    let tableView = HDTableView()
    let cellID = "cellID"
    
    init(viewModel: HeaderViewModel) {
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
        setupView()
        tableView.headerView.paralaxImage(imageName: viewModel.imageNmae)
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.register(HeaderDetailViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].forEach { $0.isActive = true }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HeaderDetailViewCell
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y / (UIScreen.main.bounds.width * 0.25)
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        if offset > 0 {
            
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
        } else {
            navigationController?.navigationBar.backgroundColor = color
            UIApplication.shared.statusBarView?.backgroundColor = color
        }
    }
}

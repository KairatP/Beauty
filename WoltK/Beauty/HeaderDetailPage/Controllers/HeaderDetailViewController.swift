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
    let tableView = HeaderDetailTableView()
    let cellID = "cellID"
//    let hraderView = DHeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.70))
    
    init(viewModel: HeaderViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        title = viewModel.title
//        tableView.tableHeaderView = hraderView
        navigationController?.navigationBar.prefersLargeTitles = false
        setupView()
        view.setNeedsLayout()
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.register(HeaderDetailViewCell.self, forCellReuseIdentifier: cellID)
        tableView.delegate = self
        tableView.dataSource = self
        
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
}

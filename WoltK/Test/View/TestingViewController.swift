//
//  TestingViewController.swift
//  WoltK
//
//  Created by Kairat on 7/17/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class TestingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let cellID = "cellID"
    let headerView = TestingHeaderView()
    let tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        tableView.register(TestingCell.self, forCellReuseIdentifier: cellID)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupView() {
        view.addSubview(headerView)
        view.addSubview(tableView)

        headerView.translatesAutoresizingMaskIntoConstraints = false
        [headerView.topAnchor.constraint(equalTo: view.topAnchor),
         headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         headerView.heightAnchor.constraint(equalToConstant: UIScreen.main.bounds.width * 0.7)
            ].forEach { $0.isActive = true }

        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ].forEach { $0.isActive = true }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TestingCell

        return cell
    }
    

}

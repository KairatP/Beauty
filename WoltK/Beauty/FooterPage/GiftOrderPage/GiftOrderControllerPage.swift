//
//  GiftOrderControllerPage.swift
//  WoltK
//
//  Created by Kairat on 9/20/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class GiftOrderControllerPage: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel: GiftOrderViewModel
    let tableView = UITableView()
    let cellID = "cellID"
    let testCellId = "TestCellID"
    
    init(viewModel: GiftOrderViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }
    
    func setupView() {
        view.addSubview(tableView)
        tableView.register(GiftOrderTableViewCell.self, forCellReuseIdentifier: cellID)
        tableView.register(TestCell.self, forCellReuseIdentifier: testCellId)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.separatorStyle = .none
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
            ].forEach { $0.isActive = true }

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GiftOrderTableViewCell
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: testCellId, for: indexPath) as! TestCell
            
            cell.priceLabel.text = "hi"
            return cell
        } else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GiftOrderTableViewCell

            cell.priceLabel.text = "my name"
            return cell
        }
        return UITableViewCell()
    }
}

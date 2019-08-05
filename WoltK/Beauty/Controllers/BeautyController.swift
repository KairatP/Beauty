//
//  BeautyController.swift
//  WoltK
//
//  Created by Kairat on 7/17/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BeautyController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView = UITableView()
    let cellID = "cellID"
    
    let beautyViewModel = BeautyViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Get your Beauty"
        
        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        tableViewSettings()
    }
    
    func tableViewSettings() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TitleTableViewCell.self, forCellReuseIdentifier: cellID)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        [tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
            ].forEach { $0.isActive = true }
        
        tableView.separatorInset = .zero
        tableView.layoutMargins = .zero
        tableView.showsVerticalScrollIndicator = false
        
        tableView.rowHeight = 205
        tableView.tableHeaderView = HeaderView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width * 0.6))
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return beautyViewModel.titleTypeSection.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let titleType = beautyViewModel.titleTypeSection[section].title
        let titleView = TitleHeaderView()
        titleView.titleLable.text = titleType
        return titleView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch beautyViewModel.titleTypeSection[indexPath.section] {
        case .bestOnSeason:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TitleTableViewCell
            let bestOnSeason = beautyViewModel.bestOnSeason
            cell.getInfo(data: bestOnSeason)
            return cell
        case .new:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TitleTableViewCell
            let new = beautyViewModel.new
            cell.getInfo(data: new)
            return cell
        case .popular:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TitleTableViewCell
            let popular = beautyViewModel.popular
            cell.getInfo(data: popular)
            return cell
        case .sale:
            let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! TitleTableViewCell
            let sale = beautyViewModel.sale
            cell.getInfo(data: sale)
            return cell
        }
    }
}


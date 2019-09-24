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
        tableView.headerView.paralaxImage(imageName: viewModel.titleImageNmae)
        tableView.showsVerticalScrollIndicator = false
        tableView.separatorStyle = .none
        tableView.tableFooterView = UIView(frame: CGRect.zero)
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
        return viewModel.introductionText.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! HeaderDetailViewCell
        cell.cellInfo(text: viewModel.introductionText[indexPath.row].text, imageName: viewModel.introductionText[indexPath.row].image)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y / (UIScreen.main.bounds.width * 0.40)
        let color = UIColor(red: 1, green: 1, blue: 1, alpha: offset)
        if offset > 0 {

            navigationController?.navigationBar.backgroundColor = color
//            UIApplication.shared.statusBarView?.backgroundColor = color
//            if let statusBar = UIStatusBarManager.self as? UIView {
//            statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
//                }
//
//            }
//
//            f let statusBar = UIStatusBarManager.self as? UIView {
//            if statusBar.responds(to: #selector(setter: UIView.backgroundColor)) {
//               statusBar.backgroundColor = #colorLiteral(red: 0, green: 0.7156304717, blue: 0.9302947521, alpha: 1)
        } else {
            navigationController?.navigationBar.backgroundColor = color
//            UIApplication.shared.statusBarView?.backgroundColor = color
        }
    }
}



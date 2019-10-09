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
    let titleView = BodyDetailTitleView()
    let cellID = "cellID"
    
    let ordertView = OrderView(frame: CGRect(x: 0, y: UIScreen.main.bounds.height, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
    let blackView = UIView()
    
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
        setupView()
        orderAction()
    }
    
    func setupView() {
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
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
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
    
    func orderAction() {
        titleView.showViewClosure = {
            self.showOrderSettings()
        }
    }
    
    func showOrderSettings() {
        if let window = UIApplication.shared.keyWindow {
            window.addSubview(blackView)
            window.addSubview(ordertView)
            blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
            blackView.frame = window.frame
            blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.blackView.alpha = 1
                self.ordertView.frame = CGRect(x: 0, y: window.frame.height - 300, width: window.frame.width, height: 300)
                    }, completion: nil)
                }
        }
    @objc func handleDismiss() {
        UIView.animate(withDuration: 0.3) {
            self.blackView.alpha = 0
            if let window = UIApplication.shared.keyWindow {
                self.ordertView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: window.frame.height)
            }
        }
    }
}


//let orderButton: UIButton = {
//    let button = UIButton()
//    button.setImage(UIImage(named: "Group 5"), for: .normal)
//    return button
//}()

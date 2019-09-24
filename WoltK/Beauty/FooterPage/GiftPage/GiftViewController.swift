//
//  GiftViewController.swift
//  WoltK
//
//  Created by Kairat on 9/7/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class GiftViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let viewModel = GiftViewModel()
    let tableView = GiftTableView()
    let cellID = "cellID"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .never
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        setupTableView()
    }
    
    func setupTableView() {
        view.addSubview(tableView)
        tableView.giftHeaderView.paralaxImage(imageName: viewModel.headerImageName)
        tableView.register(GiftTableViewCell.self, forCellReuseIdentifier: cellID)
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let titleText = UILabel()
        titleText.textAlignment = .center
        titleText.font = .systemFont(ofSize: 24)
        titleText.textColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        titleText.text = "Gift amounts:"
        return titleText
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! GiftTableViewCell
        cell.selectionStyle = UITableViewCell.SelectionStyle.none
        cell.cellData(model: viewModel.model[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerText = viewModel.giftExplanation
        let footerView = GiftFooterView()
        footerView.introductionTextView.text = footerText
        return footerView
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let giftOrderType = GiftOrderViewModel(giftType: self.viewModel.model[indexPath.row])
        let gifrtOrderController = GiftOrderControllerPage(viewModel: giftOrderType)
        navigationController?.pushViewController(gifrtOrderController, animated: true)
    }
}

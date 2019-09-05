//
//  BodyDetailViewController.swift
//  WoltK
//
//  Created by Kairat on 8/14/19.
//  Copyright © 2019 Kairat Parmanov. All rights reserved.
//

import UIKit

class BodyDetailViewController: UIViewController {
    
    let viewModel: BodyViewModel
    let tableView = BDTableView()
    
    init(viewModel: BodyViewModel) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = viewModel.model.type
    }
    
    
}

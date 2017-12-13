//
//  BaseViewController.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    var refreshControl = UIRefreshControl()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configRefreshControl()
        self.configNavigationBar()
    }
    
}

// MARK: - Private methods
private extension BaseViewController {
    
    func configRefreshControl() {
        self.refreshControl.tintColor = UIColor.darkGray
        self.refreshControl.backgroundColor = UIColor.clear
        self.refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh...")
    }
    
    func configNavigationBar() {
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
    }
    
}

// MARK: - RefreshControl
extension BaseViewController {
    
    @objc dynamic func refresh() {}
    
}

// MARK: - Global funcions
extension BaseViewController {
 
    func emptyMessage(message:String, tableView:UITableView) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: tableView.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.black
        messageLabel.numberOfLines = 0;
        messageLabel.textAlignment = .center;
        messageLabel.font = UIFont.systemFont(ofSize: 13)
        messageLabel.sizeToFit()
        
        tableView.backgroundView = messageLabel;
        tableView.separatorStyle = .none;
    }
    
}

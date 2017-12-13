//
//  BeerListView.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit
import PKHUD

class BeerListView: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: BeerListPresenterProtocol?
    var beerList: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = 130.0
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
        tableView.addSubview(self.refreshControl)
        navigationItem.rightBarButtonItem?.target = self
        navigationItem.rightBarButtonItem?.action = #selector(openFavoriteView(_:))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        presenter?.viewDidLoad()
    }
    
}

extension BeerListView: BeerListViewProtocol {
    
    func showBeers(with beer: [Beer]) {
        beerList = beer
        tableView.reloadData()
    }
    
    func showError() {
        HUD.flash(.label("Internet not connected"), delay: 2.0)
    }
    
    func showLoading() {
        if !refreshControl.isRefreshing {
            HUD.show(.progress)
            return
        }
    }
    
    func hideLoading() {
        if !refreshControl.isRefreshing {
            HUD.hide()
            return
        }
        self.refreshControl.endRefreshing()
    }
    
}

// MARK: - UITableViewDataSource
extension BeerListView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return beerList.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as! BeerListCell
        var isFavorite = false
        
        let filtered = AppPreferences.shared.favoritesBeers.filter({$0 == beerList[indexPath.row].id})
        
        if filtered.count != 0 {
            isFavorite = true
        }
        
        let beer = beerList[indexPath.row]
        cell.set(forBeer: beer, is: isFavorite)
        
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favoriteTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
}

// MARK: - UITableViewDataSource
extension BeerListView: UITableViewDelegate {
 
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.showBeerDetail(forBeer: beerList[indexPath.row])
    }
    
}

// MARK: - Private Methods
private extension BeerListView {
    
    @objc func favoriteTapped(_ sender:AnyObject) {
        
        AppPreferences.shared.favoritesBeers = [self.beerList[sender.tag].id]
        self.tableView.reloadData()
        
    }
    
    @objc func openFavoriteView(_ sender:AnyObject) {
        
        presenter?.showFavoriteBeers(forBeer: beerList)
        
    }
    
}

// MARK: - RefreshControl
extension BeerListView {
    
    override func refresh() {
        self.refreshControl.beginRefreshing()
        presenter?.viewDidLoad()
    }
    
}

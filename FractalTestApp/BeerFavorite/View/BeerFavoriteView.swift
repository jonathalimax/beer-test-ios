//
//  BeerFavoriteView.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

class BeerFavoriteView: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var presenter: BeerFavoritePresenterProtocol?
    var favoriteBeers: [Beer] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        tableView.rowHeight = 130.0
        tableView.estimatedRowHeight = UITableViewAutomaticDimension
        tableView.tableFooterView = UIView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
    }
    
}

extension BeerFavoriteView: BeerFavoriteViewProtocol {
    func showBeerFavorite(forBeer beer: [Beer]) {
        favoriteBeers = beer
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource
extension BeerFavoriteView: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if favoriteBeers.count <= 0 {
            self.emptyMessage(message: "You dont have any favorites", tableView: tableView)
        }
        
        return favoriteBeers.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as! BeerListCell
        
        var isFavorite = false
        let filtered = AppPreferences.shared.favoritesBeers.filter({$0 == favoriteBeers[indexPath.row].id})
        
        if filtered.count != 0 {
            isFavorite = true
        }
        
        let beer = favoriteBeers[indexPath.row]
        cell.set(forBeer: beer, is: isFavorite)
        
        cell.favoriteButton.tag = indexPath.row
        cell.favoriteButton.addTarget(self, action: #selector(favoriteTapped(_:)), for: .touchUpInside)
        
        return cell
    }
    
}

// MARK: - Private Methods
private extension BeerFavoriteView {
    
    @objc func favoriteTapped(_ sender:AnyObject) {
        
        AppPreferences.shared.favoritesBeers = [self.favoriteBeers[sender.tag].id]
        self.favoriteBeers.remove(at: sender.tag)
        self.tableView.reloadData()
        
    }
    
}

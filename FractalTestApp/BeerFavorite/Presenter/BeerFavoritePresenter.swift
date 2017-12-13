//
//  BeerFavoritePresenter.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation

class BeerFavoritePresenter: BeerFavoritePresenterProtocol {
    
    var view: BeerFavoriteViewProtocol?
    var wireFrame: BeerFavoriteWireFrameProtocol?
    var beers: [Beer]?
    
    func viewDidLoad() {
        
        view?.showBeerFavorite(forBeer: getFavoriteBeers())
    }
    
}

// MARK: - Private Methods
private extension BeerFavoritePresenter {
    
    func getFavoriteBeers() -> [Beer] {
        
        var filteredBeers = [Beer]()
        
        let favoriteBeers = AppPreferences.shared.favoritesBeers
        
        for beer in beers! {
         
            if let _ = favoriteBeers.index(of: beer.id) {
                filteredBeers.append(beer)
            }
            
        }
     
        return filteredBeers
    }
    
}

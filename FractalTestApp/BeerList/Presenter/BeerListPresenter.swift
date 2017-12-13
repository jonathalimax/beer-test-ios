//
//  BeerListPresenter.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation

class BeerListPresenter: BeerListPresenterProtocol {
    
    weak var view: BeerListViewProtocol?
    weak var favoriteView: BeerFavoriteViewProtocol?
    var interactor: BeerListInteractorInputProtocol?
    var wireFrame: BeerListWireFrameProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        interactor?.retrieveBeerList()
    }
    
    func showBeerDetail(forBeer beer: Beer) {
        wireFrame?.presentBeerDetailScreen(from: view!, forBeer: beer)
    }
    
    func showFavoriteBeers(forBeer beers: [Beer]) {
        wireFrame?.presentBeerFavoriteScreen(from: view!, forBeers: beers)
    }
    
}

extension BeerListPresenter: BeerListInteractorOutputProtocol {
    
    func didRetrieveBeers(_ beers: [Beer]) {
        view?.hideLoading()
        view?.showBeers(with: beers)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
    
}

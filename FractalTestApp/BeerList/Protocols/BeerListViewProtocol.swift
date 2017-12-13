//
//  BeerListViewProtocol.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

protocol BeerListViewProtocol: class {
    var presenter: BeerListPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showBeers(with beer: [Beer])
    
    func showError()
    
    func showLoading()
    
    func hideLoading()
}

protocol BeerListWireFrameProtocol: class {
    static func createBeerListModule() -> UIViewController
    // PRESENTER -> WIREFRAME
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeer beer: Beer)
    
    func presentBeerFavoriteScreen(from view: BeerListViewProtocol, forBeers beers: [Beer])
}

protocol BeerListPresenterProtocol: class {
    var view: BeerListViewProtocol? { get set }
    var interactor: BeerListInteractorInputProtocol? { get set }
    var wireFrame: BeerListWireFrameProtocol? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    func showBeerDetail(forBeer beer: Beer)
    func showFavoriteBeers(forBeer beers: [Beer])
}

protocol BeerListInteractorOutputProtocol: class {
    // INTERACTOR -> PRESENTER
    func didRetrieveBeers(_ beers: [Beer])
    func onError()
}

protocol BeerListInteractorInputProtocol: class {
    var presenter: BeerListInteractorOutputProtocol? { get set }
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol? { get set }
    
    // PRESENTER -> INTERACTOR
    func retrieveBeerList()
}

protocol BeerListDataManagerInputProtocol: class {
    // INTERACTOR -> DATAMANAGER
}

protocol BeerListRemoteDataManagerInputProtocol: class {
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol? { get set }
    
    // INTERACTOR -> REMOTEDATAMANAGER
    func retrieveBeerList()
}

protocol BeerListRemoteDataManagerOutputProtocol: class {
    // REMOTEDATAMANAGER -> INTERACTOR
    func onBeersRetrieved(_ beers: [Beer])
    func onError()
}


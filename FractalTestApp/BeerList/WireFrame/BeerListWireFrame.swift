//
//  BeerListWireFrame.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

class BeerListWireFrame: BeerListWireFrameProtocol {
    
    class func createBeerListModule() -> UIViewController {
        let navController = mainStoryboard.instantiateViewController(withIdentifier: "BeerNavigationController")
        if let view = navController.childViewControllers.first as? BeerListView {
            let presenter: BeerListPresenterProtocol & BeerListInteractorOutputProtocol = BeerListPresenter()
            let interactor: BeerListInteractorInputProtocol & BeerListRemoteDataManagerOutputProtocol = BeerListInteractor()
            let remoteDataManager: BeerListRemoteDataManagerInputProtocol = BeerListDataManager()
            let wireFrame: BeerListWireFrameProtocol = BeerListWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.wireFrame = wireFrame
            presenter.interactor = interactor
            interactor.presenter = presenter
            interactor.remoteDatamanager = remoteDataManager
            remoteDataManager.remoteRequestHandler = interactor
            
            return navController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func presentBeerDetailScreen(from view: BeerListViewProtocol, forBeer beer: Beer) {
        let beerDetailViewController = BeerDetailWireFrame.createBeerDetailModule(forBeer: beer)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(beerDetailViewController, animated: true)
        }
    }
    
    func presentBeerFavoriteScreen(from view: BeerListViewProtocol, forBeers beers: [Beer]) {
        let beerFavoriteViewController = BeerFavoriteWireFrame.createBeerFavoriteModule(forBeers: beers)
        
        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(beerFavoriteViewController, animated: true)
        }
        
    }
    
}


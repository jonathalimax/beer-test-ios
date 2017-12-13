//
//  BeerFavoriteWireFrame.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

class BeerFavoriteWireFrame: BeerFavoriteWireFrameProtocol {
    
    class func createBeerFavoriteModule(forBeers beers: [Beer]) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BeerFavoriteViewController")
        if let view = viewController as? BeerFavoriteView {
            let presenter: BeerFavoritePresenterProtocol = BeerFavoritePresenter()
            let wireFrame: BeerFavoriteWireFrameProtocol = BeerFavoriteWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.beers = beers
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}

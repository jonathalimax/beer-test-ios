//
//  BeerDetailWireFrame.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

class BeerDetailWireFrame: BeerDetailWireFrameProtocol {
    
    class func createBeerDetailModule(forBeer beer: Beer) -> UIViewController {
        let viewController = mainStoryboard.instantiateViewController(withIdentifier: "BeerDetailViewController")
        if let view = viewController as? BeerDetailView {
            let presenter: BeerDetailPresenterProtocol = BeerDetailPresenter()
            let wireFrame: BeerDetailWireFrameProtocol = BeerDetailWireFrame()
            
            view.presenter = presenter
            presenter.view = view
            presenter.beer = beer
            presenter.wireFrame = wireFrame
            
            return viewController
        }
        return UIViewController()
    }
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
}

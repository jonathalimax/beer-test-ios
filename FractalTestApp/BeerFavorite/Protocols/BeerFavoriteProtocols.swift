//
//  BeerFavoriteProtocols.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

protocol BeerFavoriteViewProtocol: class {
    var presenter: BeerFavoritePresenterProtocol? { get set }
    
    func showBeerFavorite(forBeer beer: [Beer])
    
}

protocol BeerFavoriteWireFrameProtocol: class {
    
    static func createBeerFavoriteModule(forBeers beers: [Beer]) -> UIViewController
    
}

protocol BeerFavoritePresenterProtocol: class {
    
    var view: BeerFavoriteViewProtocol? { get set }
    var wireFrame: BeerFavoriteWireFrameProtocol? { get set }
    var beers: [Beer]? { get set }
    
    func viewDidLoad()
    
}

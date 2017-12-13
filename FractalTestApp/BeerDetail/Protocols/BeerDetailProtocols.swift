//
//  BeerDetailProtocol.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit

protocol BeerDetailViewProtocol: class {
    var presenter: BeerDetailPresenterProtocol? { get set }
    
    // PRESENTER -> VIEW
    func showBeerDetail(forBeer beer: Beer)
    
}

protocol BeerDetailWireFrameProtocol: class {
    
    static func createBeerDetailModule(forBeer beer: Beer) -> UIViewController
    
}

protocol BeerDetailPresenterProtocol: class {
    
    var view: BeerDetailViewProtocol? { get set }
    var wireFrame: BeerDetailWireFrameProtocol? { get set }
    var beer: Beer? { get set }
    
    // VIEW -> PRESENTER
    func viewDidLoad()
    
}

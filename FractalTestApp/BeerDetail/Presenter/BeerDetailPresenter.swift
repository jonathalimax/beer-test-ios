//
//  BeerDetailPresenter.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation

class BeerDetailPresenter: BeerDetailPresenterProtocol {
    
    weak var view: BeerDetailViewProtocol?
    var wireFrame: BeerDetailWireFrameProtocol?
    var beer: Beer?
    
    func viewDidLoad() {
        view?.showBeerDetail(forBeer: beer!)
    }
    
}

//
//  BeerListInteractor.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

class BeerListInteractor: BeerListInteractorInputProtocol {
    weak var presenter: BeerListInteractorOutputProtocol?
    var remoteDatamanager: BeerListRemoteDataManagerInputProtocol?
    
    func retrieveBeerList() {
        
        remoteDatamanager?.retrieveBeerList()
        
    }
    
}

extension BeerListInteractor: BeerListRemoteDataManagerOutputProtocol {
    func onBeersRetrieved(_ beers: [Beer]) {
        presenter?.didRetrieveBeers(beers)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}

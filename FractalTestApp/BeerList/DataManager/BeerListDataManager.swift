//
//  BeerListDataManager.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

class BeerListDataManager: BeerListRemoteDataManagerInputProtocol {
    
    var remoteRequestHandler: BeerListRemoteDataManagerOutputProtocol?
    
    func retrieveBeerList() {
        Alamofire
            .request(Endpoints.Beer.fetch.url, method: .get)
            .validate()
            .responseArray { (response: DataResponse<[Beer]>) in
                
                switch response.result {
                case .success(let beers):
                    self.remoteRequestHandler?.onBeersRetrieved(beers)
                    
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
                
        }
    }
    
}

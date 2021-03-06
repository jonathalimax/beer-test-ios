//
//  Endpoints.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "https://api.punkapi.com/v2/"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    
    enum Beer: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/beers"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl)\(path)"
            }
        }
    }
}

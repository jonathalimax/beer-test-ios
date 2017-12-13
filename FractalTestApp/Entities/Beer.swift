//
//  Beer.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation
import ObjectMapper

struct Beer {
    var id = 0
    var name = ""
    var tagline = ""
    var imageUrl = ""
}

// MARK: - Mappable
extension Beer: Mappable {
    
    init?(map: Map) {
    }
    
    mutating func mapping(map: Map) {
        self.id <- map["id"]
        self.name <- map["name"]
        self.tagline <- map["tagline"]
        self.imageUrl <- map["image_url"]
    }
    
}

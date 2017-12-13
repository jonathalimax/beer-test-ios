//
//  AppPreferences.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 12/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import Foundation

class AppPreferences: NSObject {
    
    var userDefaults = UserDefaults.standard
    static let shared = AppPreferences()
    
    private let userFavoriteBeersID = "favoriteBeersID"
    
    var favoritesBeers: [Int] {
        get {
            if let beersId = userDefaults.object(forKey: userFavoriteBeersID) as? [Int] {
                return beersId
            }
            return [Int]()
        }
        set {
            
            let newBeer = newValue.first
            if var beersID = userDefaults.object(forKey: userFavoriteBeersID) as? [Int] {
                
                if let index = beersID.index(of: newBeer!) {
                    
                    beersID.remove(at: index)
                    
                } else {
                    
                    beersID.append(newBeer!)
                    
                }
            
                userDefaults.set(beersID, forKey: userFavoriteBeersID)
                
            } else {
                
                userDefaults.set([newBeer], forKey: userFavoriteBeersID)
                
            }
            
            userDefaults.synchronize()
        }
    }
    
    func clearUserData() {
        let appDomain = Bundle.main.bundleIdentifier!
        UserDefaults.standard.removePersistentDomain(forName: appDomain)
    }
    
}

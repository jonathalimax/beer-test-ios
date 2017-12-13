//
//  BeerListCell.swift
//  FractalTestApp
//
//  Created by Jonatha Lima on 11/12/17.
//  Copyright © 2017 Jlima. All rights reserved.
//

import UIKit
import AlamofireImage

class BeerListCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var beerImage: UIImageView!
    @IBOutlet weak var favoriteButton: UIButton!
    
    func set(forBeer beer: Beer, is favorite: Bool) {
        self.selectionStyle = .none
        nameLabel.text = beer.name
        taglineLabel.text = beer.tagline
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "ph_beer")!
        beerImage.kf.setImage(with: url, placeholder: placeholderImage, options: nil, progressBlock: nil, completionHandler: nil)
        
        if favorite {
            favoriteButton.setImage(UIImage(named: "ic_favorite"), for: .normal)
        } else {
            favoriteButton.setImage(UIImage(named: "ic_favorite_border"), for: .normal)
        }
        
    }
    
}

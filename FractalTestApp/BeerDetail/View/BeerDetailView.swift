//
//  BeerDetailView.swift
//  
//
//  Created by Jonatha Lima on 12/12/17.
//

import UIKit
import Kingfisher

class BeerDetailView: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var beerImageView: UIImageView!
    
    var presenter: BeerDetailPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }
    
}

extension BeerDetailView: BeerDetailViewProtocol {
    
    func showBeerDetail(forBeer beer: Beer) {
        titleLabel?.text = beer.name
        descriptionLabel.text = beer.tagline
        let url = URL(string: beer.imageUrl)!
        let placeholderImage = UIImage(named: "ph_beer")!
        beerImageView.kf.setImage(with: url, placeholder: placeholderImage, options: nil, progressBlock: nil, completionHandler: nil)

    }
    
}

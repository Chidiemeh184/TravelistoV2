//
//  HorizontalPlaceListCollectionViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HorizontalPlaceListCollectionViewCell: UICollectionViewCell {

    static let identifier = "HorizontalPlaceListCollectionViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    var restuarant : TravelistoPlace?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(withModel restuarant: TravelistoPlace){
        self.restuarant = restuarant
        let image = restuarant.images.first // place.place.images.randomElement()
        let url = image?.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        self.placeLabel.text = restuarant.detail.name
    }

}

//
//  RelaxationCollectionViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RelaxationCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "RelaxationCollectionViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    
    var place : ExploreBaseModel?
    
    var typeIdentityNumber = 0
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setUp(withModel place: ExploreBaseModel){
        self.place = place
        let image = place.place.images.first // place.place.images.randomElement()
        let url = image?.largeImageURL
        mainTitleLabel.text = place.place.detail.name
        
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground]) { (image, error, type, url) in
            if error == nil {
                let placeImage = image
                let imageGCColor = UIColor(averageColorFrom: placeImage).cgColor
                self.applyShadowBlurEffect(withColor: imageGCColor, cornerRadius: 8.0, shadowRadius: 5.0)
            }
        }
    }
    
}

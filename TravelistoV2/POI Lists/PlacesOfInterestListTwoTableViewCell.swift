//
//  PlacesOfInterestListTwoTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class PlacesOfInterestListTwoTableViewCell: UITableViewCell {
    static let identifier = "PlacesOfInterestListTwoTableViewCell"
    
    @IBOutlet weak var starsLabel: UILabel!
    @IBOutlet weak var restuarantNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var ratingNumberLabel: UILabel!
    @IBOutlet weak var ratingDescriptionLabel: UILabel!
    @IBOutlet weak var placeImageView: UIImageView!
    
    var place : TravelistoPlace?
   
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setUp(withModel place: TravelistoPlace){
        self.place = place
        
        let image = place.images.first
        let url = image?.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        restuarantNameLabel.text = place.detail.name
        let rating = place.detail.rating
        
        let roundedRating = rating.round(rating, to: 3)
        ratingNumberLabel.text = "\(String(describing: roundedRating))"
        switch roundedRating {
        case 8.0...11.0:
            ratingDescriptionLabel.text = "Excellent"
        case 6.0...7.9:
            ratingDescriptionLabel.text = "Very Good"
        default:
            ratingDescriptionLabel.text = "Good"
        }
        starsLabel.text =  "\(String(describing: roundedRating)) ratings"
        let localRating = place.detail.ratingLocal
        ratingNumberLabel.text = "\(String(describing: localRating.round(localRating, to: 2)))"
        addressLabel.text = place.detail.address ?? ""
    }
    
}

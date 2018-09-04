//
//  POIRatingReviewTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class POIRatingReviewTableViewCell: UITableViewCell {
    
    static let identifier = "POIRatingReviewTableViewCell"
    
    @IBOutlet weak var ratingNumberLabel: UILabel!
    @IBOutlet weak var ratingDescriptionLabel: UILabel!
    @IBOutlet weak var numberOfReviewLabel: UILabel!
    @IBOutlet weak var seeReviewsButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(withModel detail: SygicPlaceDetail){
        let rating = detail.rating
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
    }

}

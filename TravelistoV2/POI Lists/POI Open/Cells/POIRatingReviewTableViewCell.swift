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

}

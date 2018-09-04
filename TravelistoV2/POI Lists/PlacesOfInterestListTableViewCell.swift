//
//  PlacesOfInterestListTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/20/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class PlacesOfInterestListTableViewCell: UITableViewCell {
    static let identifier = "PlacesOfInterestListTableViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var starReviewLabel: UILabel!
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!

    var place : TravelistoPlace?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(withModel place: TravelistoPlace){
        self.place = place
        
        let image = place.images.first
        let url = image?.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        placeNameLabel.text = place.detail.name
        let rating = place.detail.rating
        starReviewLabel.text = "\(String(describing: rating.round(rating, to: 3))) ratings"
        placeAddressLabel.text = place.detail.address ?? " "
    }
    
}

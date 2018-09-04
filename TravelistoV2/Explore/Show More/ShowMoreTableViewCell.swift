//
//  ShowMoreTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ShowMoreTableViewCell: UITableViewCell {

    static let identifier = "ShowMoreTableViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var pointsOfInterestNumberLabel: UILabel!
    
    var place : ExploreBaseModel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setUp(withModel place: ExploreBaseModel){
        self.place = place
        let image = place.place.images.first
        let url = image?.largeImageURL
        mainTitleLabel.text = place.place.detail.name
        pointsOfInterestNumberLabel.text = "\(place.placesOfInterest[0].count) places of interest"
        
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground])
        
    }
    
}

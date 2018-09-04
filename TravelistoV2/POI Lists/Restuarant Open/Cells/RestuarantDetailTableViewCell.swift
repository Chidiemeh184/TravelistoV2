//
//  RestuarantDetailTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RestuarantDetailTableViewCell: UITableViewCell {
    
    static let identifier = "RestuarantDetailTableViewCell"
    
    @IBOutlet weak var restuarantImageView: UIImageView!
    @IBOutlet weak var restuarantTypeLabel: UILabel!
    
    @IBOutlet weak var restuarantNameLabel: UILabel!
    @IBOutlet weak var restuarantRatingLabel: UILabel!
    @IBOutlet weak var restuarantPriceRangeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func setUp(withModel place: TravelistoPlace ){
        
        restuarantNameLabel.text = place.detail.name
        let image = place.images.first
        let url = image?.largeImageURL
        restuarantImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        restuarantTypeLabel.text = place.detail.nameSuffix
        let rating = place.detail.rating
        let localRating = (place.detail.ratingLocal * 100)
        restuarantRatingLabel.text = "\(String(describing: rating.round(rating, to: 3))) (\(String(describing: localRating.round(localRating, to: 1))) ratings)"
        restuarantPriceRangeLabel.text = place.detail.admission ?? ""
        
    }
}

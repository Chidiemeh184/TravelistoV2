//
//  POIDetailTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import MapKit

class POIDetailTableViewCell: UITableViewCell {
    
    static let identifier = "POIDetailTableViewCell"
    
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var viewPhotosButton: UIButton!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var placeNameLabel: UILabel!
    @IBOutlet weak var placeAddressLabel: UILabel!
    
    @IBOutlet weak var placeMapview: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}

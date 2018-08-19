//
//  PlaceMapTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import MapKit

class PlaceMapTableViewCell: UITableViewCell {
    
    static let identifier = "PlaceMapTableViewCell"

    @IBOutlet weak var placeMapView: MKMapView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.placeMapView.layer.cornerRadius = 8
        self.placeMapView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

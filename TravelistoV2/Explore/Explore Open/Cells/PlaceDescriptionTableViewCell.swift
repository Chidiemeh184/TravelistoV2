//
//  PlaceDescriptionTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class PlaceDescriptionTableViewCell: UITableViewCell {
    
    static let identifier = "PlaceDescriptionTableViewCell"
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionMoreButton: UIButton!
    
    var indexpathToReload: IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        if !descriptionLabel.isTruncated {
            descriptionMoreButton.isHidden = true
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

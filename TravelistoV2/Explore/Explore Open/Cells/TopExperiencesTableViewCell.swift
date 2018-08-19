//
//  TopExperiencesTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TopExperiencesTableViewCell: UITableViewCell {

    static let identifier = "TopExperiencesTableViewCell"
    @IBOutlet weak var showMoreButtton: UIButton!
    
    @IBOutlet weak var placeOneImageView: UIImageView!
    @IBOutlet weak var placeOneLabel: UILabel!
    @IBOutlet weak var placeTwoImageView: UIImageView!
    @IBOutlet weak var placeTwoLabel: UILabel!
    @IBOutlet weak var placeThreeImageView: UIImageView!
    @IBOutlet weak var placeThreeLabel: UILabel!
    @IBOutlet weak var placeFourImageView: UIImageView!
    @IBOutlet weak var placeFourLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

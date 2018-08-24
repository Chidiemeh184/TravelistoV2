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

}

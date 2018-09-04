//
//  HorizontalPlaceListTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HorizontalPlaceListTableViewCell: UITableViewCell {
    
    static let identifier = "HorizontalPlaceListTableViewCell"
    @IBOutlet weak var horizontalPlaceCollectionView: UICollectionView!
    @IBOutlet weak var horizontalPlaceShoeMoreButton: UIButton!
    @IBOutlet weak var horizontalPlaceTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

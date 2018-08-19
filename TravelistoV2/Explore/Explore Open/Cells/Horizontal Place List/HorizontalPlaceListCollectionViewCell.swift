//
//  HorizontalPlaceListCollectionViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class HorizontalPlaceListCollectionViewCell: UICollectionViewCell {

    static let identifier = "HorizontalPlaceListCollectionViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var placeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

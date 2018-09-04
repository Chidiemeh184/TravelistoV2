//
//  RelaxationTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/15/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RelaxationTableViewCell: UITableViewCell {

    @IBOutlet weak var relaxationCollectionView: UICollectionView!
    @IBOutlet weak var showMoreButton: UIButton!
    @IBOutlet weak var relaxationHeaderTitleLabel: UILabel!
    static let identifier = "RelaxationTableViewCell"
    
    var typeIdentityNumber = 0
    
    var places : [ExploreBaseModel]?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

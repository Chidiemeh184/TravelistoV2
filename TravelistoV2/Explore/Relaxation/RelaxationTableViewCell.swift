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
    
    static let identifier = "RelaxationTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

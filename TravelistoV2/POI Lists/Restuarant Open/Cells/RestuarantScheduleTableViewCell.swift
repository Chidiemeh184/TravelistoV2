//
//  RestuarantScheduleTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RestuarantScheduleTableViewCell: UITableViewCell {
    
    static let identifier = "RestuarantScheduleTableViewCell"
    
    @IBOutlet weak var dayOneLabel: UILabel!
    @IBOutlet weak var dayTwoLabel: UILabel!
    @IBOutlet weak var dayOneTimeLabel: UILabel!
    @IBOutlet weak var dayTwoTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setUp(withModel place: TravelistoPlace ){
        
        
    }

}

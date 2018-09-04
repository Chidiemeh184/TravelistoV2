//
//  RestuarantAddressTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/23/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class RestuarantAddressTableViewCell: UITableViewCell {

    static let identifier = "RestuarantAddressTableViewCell"
    
    @IBOutlet weak var detailInformationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(withModel address: String){
        detailInformationLabel.text = address
    }
    

}

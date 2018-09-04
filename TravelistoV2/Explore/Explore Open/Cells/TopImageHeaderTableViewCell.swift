//
//  TopImageHeaderTableViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/18/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class TopImageHeaderTableViewCell: UITableViewCell {
    
    static let identifier = "TopImageHeaderTableViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    @IBOutlet weak var titleCaptionOneLabel: UILabel!
    @IBOutlet weak var titleCaptionTwoLabel: UILabel!
    
    @IBOutlet weak var starOneImageView: UIImageView!
    @IBOutlet weak var starTwoImageView: UIImageView!
    @IBOutlet weak var starThreeImageView: UIImageView!
    @IBOutlet weak var starFourImageView: UIImageView!
    @IBOutlet weak var starFiveImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setUp(withModel placeDetail: TravelistoPlace){
        
        //Set Up Image
        let image = placeDetail.images.first// place.place.images.randomElement()
        let url = image?.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
        titleCaptionOneLabel.text = placeDetail.detail.name
    }
    
}

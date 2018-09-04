//
//  SlideShowCollectionViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/19/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class SlideShowCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SlideShowCollectionViewCell"
    @IBOutlet weak var placeImageView: UIImageView!
    
    func setUp(withImage image : PixabayImage){
        let url = image.largeImageURL
        placeImageView.sd_setImage(with: url, placeholderImage: #imageLiteral(resourceName: "imagePlaceHolder"), options: [.continueInBackground], completed: nil)
    }
    
}

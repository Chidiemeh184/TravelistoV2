//
//  OnboardingCollectionViewCell.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/8/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "OnboardingCollectionViewCell"
    
    @IBOutlet weak var onboardImageView: UIImageView!
    @IBOutlet weak var onboardMessageLabel: UILabel!
    
    override func awakeFromNib() {
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.borderWidth = 3
        self.onboardImageView.layer.cornerRadius = onboardImageView.frame.height / 2
        self.onboardImageView.clipsToBounds = true
    }
    
    func setUp(withImage image: UIImage, message text: String){
        self.onboardImageView.image = image
        self.onboardMessageLabel.text = text
    }
    
}

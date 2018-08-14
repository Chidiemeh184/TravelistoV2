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
        self.onboardImageView.layer.cornerRadius = onboardImageView.frame.height * 0.50
        self.onboardImageView.clipsToBounds = true
        self.onboardImageView.layer.borderColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        self.onboardImageView.layer.borderWidth = 0.2
    }
    
    func setUp(withImage image: UIImage, message text: String){
        self.onboardImageView.image = image
        self.onboardMessageLabel.text = text
    }
    
}

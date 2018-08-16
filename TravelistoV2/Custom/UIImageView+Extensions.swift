//
//  UIImageView+Extensions.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/16/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import ChameleonFramework

extension UIImageView {
    
    func applyShadowBlurEffect(){
        guard let image = self.image else {
            return
        }
        let colorFromImage = UIColor(averageColorFrom: image).cgColor
        self.layer.shadowColor = colorFromImage
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = CGSize.zero
        self.layer.shadowRadius = 10
    }
    
}

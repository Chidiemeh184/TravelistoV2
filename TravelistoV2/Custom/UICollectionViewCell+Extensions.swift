//
//  UITableViewCell+Extensions.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/16/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import  UIKit

extension UICollectionViewCell {
    
    func applyShadowBlurEffect(withColor color: CGColor, cornerRadius: CGFloat, shadowRadius: CGFloat){
        self.contentView.layer.cornerRadius = cornerRadius
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowColor =  color
        self.layer.shadowOffset = CGSize(width:0,height: 0.0)
        self.layer.shadowRadius = shadowRadius
        self.layer.shadowOpacity = 1.0
        self.layer.masksToBounds = false;
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: self.contentView.layer.cornerRadius).cgPath
    }
    
    func applyCornerRadius(cornerRadius: CGFloat){
        self.contentView.layer.cornerRadius = cornerRadius
        self.contentView.clipsToBounds = true
    }
}

//
//  CustomTextField.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class CustomTextField: UITextField {
    
    override func awakeFromNib() {
        setupViewProperties()
    }
    
    func setupViewProperties(){
        self.layer.cornerRadius = 8
        let lightGray = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
        self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes:[NSAttributedStringKey.foregroundColor : lightGray])
        self.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }
}

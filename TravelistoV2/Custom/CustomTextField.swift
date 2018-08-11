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
        self.layer.borderWidth = 0.3
        self.layer.borderColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)  
        let lightGray = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 0.8969927226)
        self.attributedPlaceholder = NSAttributedString(string: placeholder!, attributes:[NSAttributedStringKey.foregroundColor : lightGray])
        self.layer.sublayerTransform = CATransform3DMakeTranslation(12, 0, 0)
    }
}

//
//  CustomButton.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
    
    override func awakeFromNib() {
        setUp()
    }
    
    func setUp(){
        let backgroundColor = #colorLiteral(red: 0.9411764706, green: 0.3529411765, blue: 0.3254901961, alpha: 1)
        self.layer.backgroundColor = backgroundColor.cgColor
        self.layer.frame.size = CGSize(width: 335, height: 56)
        self.layer.cornerRadius = self.layer.frame.height/2
        
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.lightGray.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1.0)
        layer.shadowOpacity = 0.2
        layer.shadowRadius = 4.0
    }
}

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
        
        self.layer.borderColor = #colorLiteral(red: 1, green: 0.4932718873, blue: 0.4739984274, alpha: 1)
        self.layer.borderWidth = 0.5
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        layer.shadowOpacity = 0.5
        layer.shadowRadius = 4.0
        layer.shadowPath = UIBezierPath(roundedRect: layer.bounds, cornerRadius: layer.cornerRadius).cgPath
        applyTextSpacing()
    }
    
    private func applyTextSpacing(){
        let spacing = 1.25
        guard let labelText = self.titleLabel?.text else {
            return
        }
        let fontAttribute = [ NSAttributedStringKey.font: UIFont(name: "SFProDisplay-medium", size: 17.0)!]
        let logInButtonAtrributedString = NSMutableAttributedString(string: labelText, attributes: fontAttribute)
        logInButtonAtrributedString.addAttribute(NSAttributedStringKey.kern, value: spacing, range: NSMakeRange(0, logInButtonAtrributedString.length))
        self.setAttributedTitle(logInButtonAtrributedString, for: .normal)
    }
}

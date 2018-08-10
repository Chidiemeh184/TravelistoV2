//
//  UIViewController+Extensions.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideNav(){
        self.navigationController?.navigationBar.isHidden = true
    }
    func showNav(){
        self.navigationController?.navigationBar.isHidden = false
    }
    func enableLeftSwipe(){
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
}

//
//  UIViewController+Extensions.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func hideNav() {
        self.navigationController?.navigationBar.isHidden = true
    }
    func hideTabBar() {
        self.navigationController?.tabBarController?.tabBar.isHidden = true
    }
    func showNav() {
        self.navigationController?.navigationBar.isHidden = false
    }
    func showTabBar() {
        self.navigationController?.tabBarController?.tabBar.isHidden = false
    }
    func enableLeftSwipe() {
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    func makeNavBarInvisible() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = .clear
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UIApplication.shared.statusBarStyle = .lightContent
    }
}

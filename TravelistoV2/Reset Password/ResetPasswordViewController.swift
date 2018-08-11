//
//  ResetPasswordViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

class ResetPasswordViewController: UIViewController, UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var emailTextField: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        navBar.setValue(true, forKey: "hidesShadow")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideNav()
        self.loadViewIfNeeded()
        self.enableLeftSwipe()
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func resetPasswordButtonTapped(_ sender: CustomButton) {
    }
    
}

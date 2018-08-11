//
//  CreateAccountViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import SVProgressHUD

class CreateAccountViewController: UIViewController, UIGestureRecognizerDelegate  {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var usernameTextField: CustomTextField!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
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
    
    @IBAction func signUpButtonTapped(_ sender: CustomButton) {
        guard let username = emailTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        AuthService.signUp(username: username, email: email, password: password, onSuccess: { (user) in
            SVProgressHUD.showSuccess(withStatus: "Success!")
            //Set Global User path with created user
        }) { (errorMessage) in
             SVProgressHUD.showError(withStatus: errorMessage)
        }
    }
}

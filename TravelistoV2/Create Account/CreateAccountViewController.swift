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
        CustomProgressHud.blackTheme()
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! || (usernameTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: TravelistoMessages.emptySignUpFieldsErrorMessage)
        }else {
            guard let username = usernameTextField.text, let email = emailTextField.text,
                let password = passwordTextField.text else {
                return
            }
            AuthService.signUp(username: username, email: email, password: password, onSuccess: { (user) in
                user.sendEmailVerification(completion: nil)
                CustomProgressHud.blackTheme()
                SVProgressHUD.showSuccess(withStatus: TravelistoMessages.createdUserSuccess)
                SVProgressHUD.setMaximumDismissTimeInterval(8)
                DispatchQueue.main.asyncAfter(deadline: .now() + 8) {
                    //GO TO HOME
                    //self.navigationController?.popViewController(animated: true)
                }
            }) { (errorMessage) in
                SVProgressHUD.showError(withStatus: errorMessage)
            }
            
        }
    }
}

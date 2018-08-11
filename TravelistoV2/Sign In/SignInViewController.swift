//
//  SignInViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import SVProgressHUD

class SignInViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var emailTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    @IBOutlet weak var forgotPasswordButton: UIButton!
    
    private var loginTriesCount = 0
    
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
    
    @IBAction func signInButtonTapped(_ sender: CustomButton) {
        loginTriesCount = loginTriesCount + 1
        guard let email = emailTextField.text, let password = passwordTextField.text else {
            return
        }
        
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setMaximumDismissTimeInterval(3.0)
        
        AuthService.signIn(email: email, password: password, onSuccess: {
            //Segue to home
            SVProgressHUD.showSuccess(withStatus: "Success!")
        }) { (errorMessage) in
            SVProgressHUD.showError(withStatus: errorMessage)
            if self.loginTriesCount == 2 && errorMessage == SignInErrorMessages.incorrectPassword {
                self.forgotPasswordButton.isHidden = false
            }
        }
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        
    }

}

//MARK - Textfield Delegates
extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



private struct SignInErrorMessages {
    static let incorrectPassword = "The password is invalid or the user does not have a password."
}






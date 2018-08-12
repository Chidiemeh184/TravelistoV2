//
//  SignInViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import FirebaseAuth
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
        self.checkAlreadyExistingUser()
    }
    
    @IBAction func backButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func signInButtonTapped(_ sender: CustomButton) {
        CustomProgressHud.blackTheme()
        if (emailTextField.text?.isEmpty)! || (passwordTextField.text?.isEmpty)! {
            SVProgressHUD.showError(withStatus: TravelistoMessages.emptySignInFieldsErrorMessage)
        }else {
            guard let email = emailTextField.text, let password = passwordTextField.text else {
                return
            }
            AuthService.signIn(email: email, password: password, onSuccess: {
                //Segue to home
                SVProgressHUD.showSuccess(withStatus: TravelistoMessages.sucess)
            }) { (errorMessage) in
                self.loginTriesCount = self.loginTriesCount + 1
                SVProgressHUD.showError(withStatus: errorMessage)
                if self.loginTriesCount == 2 && errorMessage == TravelistoMessages.wrongPasswordErrorMessage {
                    self.forgotPasswordButton.isHidden = false
                }
            }
        }
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        
    }
    
    private func checkAlreadyExistingUser(){

    }

}

//MARK - Textfield Delegates
extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



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
    @IBOutlet weak var signInLeftBarButtonItem: UIBarButtonItem!
    private var loginTriesCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        self.navigationController?.interactivePopGestureRecognizer?.delegate = self
        navBar.setValue(true, forKey: "hidesShadow")
        hideNavBarBackButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.hideNav()
        self.loadViewIfNeeded()
        self.enableLeftSwipe()
        hideNavBarBackButton()
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
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: Segue.signInToTabbar, sender: nil)
                }
            }) { (errorMessage) in
                self.loginTriesCount = self.loginTriesCount + 1
                SVProgressHUD.showError(withStatus: errorMessage)
                if self.loginTriesCount == 2 && errorMessage == TravelistoMessages.wrongPasswordErrorMessage {
                    self.forgotPasswordButton.isHidden = false
                }
            }
        }
    }

    private func presentTabBar(){
        let storyboard = UIStoryboard(name: Storyboard.main, bundle: nil)
        let tabBarController = storyboard.instantiateViewController(withIdentifier: Storyboard.tabBar) as! UITabBarController
        self.present(tabBarController, animated: true, completion: nil)
    }
    
    private func hideNavBarBackButton() {
        let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
        if launchedBefore  {
            self.signInLeftBarButtonItem.isEnabled = false
            self.signInLeftBarButtonItem.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
        }
    }
    
    @IBAction func forgotPasswordButtonTapped(_ sender: UIButton) {
        self.performSegue(withIdentifier: Segue.signInToResetPassword, sender: nil)
    }
    
}

//MARK - Textfield Delegates
extension SignInViewController : UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}



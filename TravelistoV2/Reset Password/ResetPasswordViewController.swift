//
//  ResetPasswordViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import FirebaseAuth
import SVProgressHUD

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
        guard let email = emailTextField.text, !email.isEmpty else {
            return
        }
        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            CustomProgressHud.blackTheme()
            if error != nil {
                SVProgressHUD.showError(withStatus: error.debugDescription)
            }
        }
        SVProgressHUD.showInfo(withStatus: TravelistoMessages.passwordResetMessage)
        SVProgressHUD.setMaximumDismissTimeInterval(5)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.navigationController?.popViewController(animated: true)
            SVProgressHUD.setMaximumDismissTimeInterval(2)
        }
    }
    
}

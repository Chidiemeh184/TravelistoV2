//
//  AuthService.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/9/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit

import Firebase
import FirebaseDatabase
import FirebaseStorage
import FirebaseAuth

class AuthService {
    
    //MARK: Sign In
    static func signIn(email: String, password: String, onSuccess: @escaping ()-> Void, onError: @escaping (_ errorMessage: String?)-> Void){
        Auth.auth().signIn(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                onError(error!.localizedDescription)
                return
            }
            onSuccess()
        })
    }
    
    //MARK: Sign Up
    static func signUp(username: String, email: String, password: String, onSuccess: @escaping (_ user: User)-> Void, onError: @escaping (_ errorMessage: String?)-> Void){
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let user = result?.user, error == nil else {
                onError(error!.localizedDescription)
                return
            }
            let ref = Database.database().reference()
            let usersReference = ref.child("users")
            let newUserReference = usersReference.child(user.uid)
            newUserReference.setValue(["username": username, "email": email])
            onSuccess(user)
        }
    }
    
    
}




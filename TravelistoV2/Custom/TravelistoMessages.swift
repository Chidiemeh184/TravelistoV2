//
//  TravelistoMessages.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation

struct TravelistoMessages {
    
    //MARK: Errors
    static let passwordResetMessage = "Password reset sent! Please check your email to reset your password."
    static let wrongPasswordErrorMessage =  "The password is invalid or the user does not have a password."
    static let emptySignInFieldsErrorMessage = "Please enter an email and password."
    static let emptySignUpFieldsErrorMessage = "Please enter a username, email and password."
    
    //MARK: Events
    static let createdUserSuccess = "Success! \n A email verification has been sent to your email address. Please follow the link to verify and comelete your registration."
    static let sucess = "Success"
    
    //MARK: Onboarding
    static let onboarding1 = "Explore travel destinations"
    static let onboarding2 = "Find cheap flight and more savings"
    static let onboarding3 = "Checkout best restuarants nearby"
    static let onboarding4 = "There's more comfort where you'll sleep"
    
}

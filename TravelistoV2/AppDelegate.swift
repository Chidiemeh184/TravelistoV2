//
//  AppDelegate.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import SVProgressHUD

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        UITextField.appearance().tintColor = #colorLiteral(red: 0.1411764706, green: 0.1450980392, blue: 0.2392156863, alpha: 1)
        
        let storyboard = UIStoryboard(name: Storyboard.main, bundle: nil)
        
//        do {
//            try Auth.auth().signOut()
//        }catch let logoutError {
//            SVProgressHUD.showError(withStatus: logoutError.localizedDescription)
//        }
        
        //Sign In Already Existing User
        if Auth.auth().currentUser != nil {
            let tabBarController = storyboard.instantiateViewController(withIdentifier: Storyboard.tabBar) as! UITabBarController
            window?.rootViewController = tabBarController
            
        }else{
            //show login Screen
            let launchedBefore = UserDefaults.standard.bool(forKey: "launchedBefore")
            if launchedBefore  {
                let signInViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.SignInViewController) as! SignInViewController
                signInViewController.isSecondLaunched = true
                window?.rootViewController = signInViewController
            } else {
                UserDefaults.standard.set(true, forKey: "launchedBefore")
//                let onboardingViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.OnboardingViewController) as! OnboardingViewController
//                let startNavigationController = storyboard.instantiateViewController(withIdentifier: Storyboard.StartNavigationController) as! UINavigationController
////                let signInViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.SignInViewController) as! SignInViewController
////                let createAccountViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.CreateAccountViewController) as! CreateAccountViewController
////                let ResetPasswordViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.ResetPasswordViewController) as! ResetPasswordViewController
////                let tabBarController = storyboard.instantiateViewController(withIdentifier: Storyboard.tabBar) as! UITabBarController
////                startNavigationController.viewControllers = [onboardingViewController, signInViewController, createAccountViewController, ResetPasswordViewController]
//                startNavigationController.viewControllers = [onboardingViewController]
//                window?.rootViewController = startNavigationController
            }
        }
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}


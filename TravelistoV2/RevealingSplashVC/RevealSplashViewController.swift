//
//  RevealSplashViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import RevealingSplashView

class RevealSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideNav()
        self.hideTabBar()
        let revealingSplashView = RevealingSplashView(iconImage: #imageLiteral(resourceName: "Travelisto-logo"), iconInitialSize: CGSize(width: 100, height: 100), backgroundColor: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0))
        revealingSplashView.animationType = .heartBeat
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.startAnimation(){
            print("Completed")
            self.showNav()
            self.showTabBar()
            let storyboard = UIStoryboard(name: Storyboard.main, bundle: nil)
            let exploreTableViewController = storyboard.instantiateViewController(withIdentifier: Storyboard.ExploreTableViewController) as! ExploreTableViewController
            self.navigationController?.pushViewController(exploreTableViewController, animated: false)
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
            revealingSplashView.heartAttack = true
        }
       
    }



}

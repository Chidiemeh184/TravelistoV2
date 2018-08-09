//
//  ViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/4/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import RevealingSplashView

class RevealingSplashViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let revealingSplashView = RevealingSplashView(iconImage: UIImage(named: "Travelisto-logo")!, iconInitialSize: CGSize(width: 100, height: 100), backgroundColor: UIColor(red:1.0, green:1.0, blue:1.0, alpha:1.0))
        revealingSplashView.animationType = .heartBeat
        self.view.addSubview(revealingSplashView)
        
        revealingSplashView.startAnimation(){
            print("Completed")
        }
        
        _ = Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { (timer) in
           revealingSplashView.heartAttack = true
        }

        
    }


}


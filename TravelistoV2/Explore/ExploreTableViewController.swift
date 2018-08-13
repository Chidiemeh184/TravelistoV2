//
//  ExploreTableViewController.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import UIKit
import RevealingSplashView

class ExploreTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //self.hideNav()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        let tabVC = RevealSplashViewController(nibName: "RevealSplashViewController", bundle: nil)
//        self.modalPresentationStyle = .fullScreen
//        self.present(tabVC, animated: false, completion: nil)
        self.navigationItem.largeTitleDisplayMode = .always
    }

}

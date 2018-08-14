//
//  CustomProgressHud.swift
//  TravelistoV2
//
//  Created by Chidi Emeh on 8/11/18.
//  Copyright © 2018 Chidi Emeh. All rights reserved.
//

import Foundation
import SVProgressHUD

struct CustomProgressHud {
    
    static func blackTheme() {
        SVProgressHUD.setDefaultStyle(.dark)
        SVProgressHUD.setDefaultMaskType(.custom)
        SVProgressHUD.setMaximumDismissTimeInterval(3.0)
    }
}

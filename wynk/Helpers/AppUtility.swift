//
//  AppUtility.swift
//  wynk
//
//  Created by Python on 6/12/20.
//  Copyright © 2020 Sanjay. All rights reserved.
//

import UIKit

class AppUtility: NSObject {
    
    static var Navigation = UINavigationController()
    static var coreData = AppCoreData()
    
    class func launchApp(window:UIWindow) {
   
        let vcSearch = VCSearch.init(nibName: "VCSearch", bundle: nil)
        AppUtility.Navigation = UINavigationController.init(rootViewController: vcSearch)
        window.rootViewController = AppUtility.Navigation        
        window.makeKeyAndVisible()
        
    }
    
}


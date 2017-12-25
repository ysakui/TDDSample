//
//  TestAppDelegate.swift
//  TDDSample
//
//  Created by SakuiYoshimitsu on 2017/12/20.
//  Copyright © 2017年 ysakui. All rights reserved.
//

import UIKit

final class TestAppDelegate: UIResponder, UIApplicationDelegate {
    
    let window: UIWindow = UIWindow(frame: UIScreen.main.bounds)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        self.window.rootViewController = UIViewController()
        self.window.makeKeyAndVisible()
        
        return true
    }
}

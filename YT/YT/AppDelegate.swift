//
//  AppDelegate.swift
//  YT
//
//  Created by SinZih Liou on 2020/5/9.
//  Copyright © 2020 nickliu. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        let layout = UICollectionViewFlowLayout()
        let vc = HomeComtroller(collectionViewLayout: layout)
        window?.rootViewController = UINavigationController(rootViewController: vc )
        
        return true
    }

}


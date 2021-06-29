//
//  AppDelegate.swift
//  SwensonTask
//
//  Created by Mohamed Eldewaik on 28/06/2021.
//

import UIKit
import AlamofireEasyLogger

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    let alamofireLogger = FancyAppAlamofireLogger(prettyPrint: true) {
        print($0)
    }

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window?.makeKeyAndVisible()
        return true
    }



}


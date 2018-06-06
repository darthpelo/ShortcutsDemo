//
//  AppDelegate.swift
//  ShortcutsDemo
//
//  Created by Alessio Roberto on 06/06/2018.
//  Copyright © 2018 Alessio Roberto. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }

    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        if userActivity.activityType == "com.alessioroberto.example.showinfo" {
            print("Show info...")
            UserDefaults.standard.actionState = "com.alessioroberto.example.showinfo"
        } else if userActivity.activityType == "com.alessioroberto.example.showmoreinfo" {
            print("Show more info...")
            UserDefaults.standard.actionState = "com.alessioroberto.example.showmoreinfo"
        }
        return true
    }


}


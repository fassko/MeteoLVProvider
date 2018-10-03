//
//  AppDelegate.swift
//  MeteoLVProvider
//
//  Created by fassko on 02/16/2018.
//  Copyright (c) 2018 fassko. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    let viewController = ViewController()
    window!.rootViewController = viewController
    window!.makeKeyAndVisible()
    return true
  }

}


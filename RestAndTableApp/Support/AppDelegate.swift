//
//  AppDelegate.swift
//  RestAndTableApp
//
//  Created by Victor Smirnov on 05/06/2019.
//  Copyright © 2019 Victor Smirnov. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?


  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    
    let navigationBarProxy = UINavigationBar.appearance()
    navigationBarProxy.barTintColor = #colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)
    navigationBarProxy.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    navigationBarProxy.titleTextAttributes = [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), .font: UIFont(name: "Helvetica Neue", size: 24.0)!]
    
    return true
  }

}

extension UINavigationController {
  
  override open var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }
  open override var childForStatusBarStyle: UIViewController? {
    return nil
  }
}

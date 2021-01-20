//
//  AppDelegate.swift
//  Beer
//
//  Created by Ian Pablo on 18/01/21.
//

import UIKit
import Alamofire

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?
  let navigator = Navigator()

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

    let feedNavigation = window!.rootViewController!  as! UINavigationController
    navigator.show(segue: .listBeer, sender: feedNavigation)
    
    return true
  }
}



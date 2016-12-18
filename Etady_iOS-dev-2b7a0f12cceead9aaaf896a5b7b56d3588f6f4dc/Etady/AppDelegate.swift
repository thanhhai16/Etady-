//
//  AppDelegate.swift
//  Etady
//
//  Created by trung on 11/8/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit
import GoogleMaps
import GooglePlaces

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, willFinishLaunchingWithOptions launchOptions: [NSObject : AnyObject]?) -> Bool {
        GMSServices.provideAPIKey("AIzaSyCri0TTWy_LbIMAmmR_6IWvrn5xLJUAdgc")
        GMSPlacesClient.provideAPIKey("AIzaSyCri0TTWy_LbIMAmmR_6IWvrn5xLJUAdgc")
        return true
    }


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        GMSServices.provideAPIKey("AIzaSyCri0TTWy_LbIMAmmR_6IWvrn5xLJUAdgc")
//        GMSPlacesClient.provideAPIKey("AIzaSyCri0TTWy_LbIMAmmR_6IWvrn5xLJUAdgc")
        return true
    }

    func applicationWillResignActive(application: UIApplication) {

    }

    func applicationDidEnterBackground(application: UIApplication) {
          }

    func applicationWillEnterForeground(application: UIApplication) {
          }

    func applicationDidBecomeActive(application: UIApplication) {
          }

    func applicationWillTerminate(application: UIApplication) {
           }


}


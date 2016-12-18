//
//  SystemUtils.swift
//  Etady
//
//  Created by trung on 11/22/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import Foundation
import Toast_Swift

public class SystemUtils {
    
    public static func setIsLogin(il: Bool){
        NSUserDefaults.standardUserDefaults().setBool(il, forKey: "is_login")
    }
    
    public static func getIsLogin() -> Bool{
        return NSUserDefaults.standardUserDefaults().boolForKey("is_login")
    }
    public static func getAccessToken() -> String{
        guard let token = NSUserDefaults.standardUserDefaults().objectForKey("token") else {
            return ""
        }
        return token as! String
        
    }
    public static func getUserName() -> String{
        return NSUserDefaults.standardUserDefaults().stringForKey("user_name")!
    }
    
    
    
    public static func getCurrentMillis()->Int64{
        return  Int64(NSDate().timeIntervalSince1970 * 1000)
    }
    
    public static func log(logMessage: AnyObject) {
        print(logMessage, separator: ": ", terminator: "ETADYLOG")
        print(" ")
    }
    
    public static func showMessage(v:UIViewController, str:String){
        dispatch_async(dispatch_get_main_queue(), {
            let alert = UIAlertController(title: "Alert!", message: str, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { (alert: UIAlertAction!) in
                print("")
                UIApplication.sharedApplication().openURL(NSURL(string:UIApplicationOpenSettingsURLString)!)
            }))
            v.presentViewController(alert, animated: true, completion: nil)
            //                self.window?.rootViewController?.presentViewController(alert, animated: true, completion: nil)
        })
   }
    public static func checkConnected() -> Bool {
        var connected = false
        do
        {
            connected = try Reachability.reachabilityForInternetConnection().isReachable()
            
            if connected == true
            {
                print("Internet connection OK")
            }
            else
            {
//                view.makeToast("Không kết nối được Internet", duration:  2.0, position: .Center)
                print("Internet connection FAILED")
                let alert = UIAlertView(title: "Error", message: "No Internet Connection", delegate: nil, cancelButtonTitle: "OK")
                alert.show()
            }
        }
        catch
        {
            print("Handle Exception")
            
        }
        return connected
    }

}

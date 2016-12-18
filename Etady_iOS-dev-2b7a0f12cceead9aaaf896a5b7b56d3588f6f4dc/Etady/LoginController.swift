//
//  LoginController.swift
//  Etady
//
//  Created by trung on 11/10/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var skipButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        btnLogin.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        skipButton.addTarget(self, action: #selector(buttonTapped), forControlEvents: .TouchUpInside)
        
    }

    @IBAction func hideKeyboard(sender: AnyObject) {
        userName.endEditing(true)
        passWord.endEditing(true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func buttonTapped(sender: UIButton) {
        if sender  == btnLogin{
            var connected:Bool=false
            //Check internet
            do
            {
                connected = try Reachability.reachabilityForInternetConnection().isReachable()
                
                if connected == true
                {
                    print("Internet connection OK")
                }
                else
                {
                    print("Internet connection FAILED")
                    let alert = UIAlertView(title: "No Internet Connection", message: "Make sure your device is connected to the internet.", delegate: nil, cancelButtonTitle: "OK")
                    alert.show()
                }
            }
            catch
            {
                print("Handle Exception")
                
            }
            //Parameters
            if(connected){
                let parameters = [
                    "username":self.userName.text! as String
                    , "password":self.passWord.text! as String
                ]
                userName.resignFirstResponder()
                passWord.resignFirstResponder()
                
                
                Alamofire.request(.POST, "http://etady.com/api/user/login", parameters: parameters, encoding: .URL)
                    .responseJSON { response in
                        //                debugPrint(response)     // prints detailed description of all response properties
                        //                print(response.request)  // original URL request
                        //                print(response.response) // URL response
                        //                print(response.data)     // server data
                        print(response.result)   // result of response serialization
                        let data = JSON(response.result.value!)
                        if data["error"].intValue == 0{
                            SystemUtils.setIsLogin(true)
                            //Add to NSUserDefautl
                            NSUserDefaults.standardUserDefaults().setObject(data["data"]["access_token"].string, forKey: "token")
                            NSUserDefaults.standardUserDefaults().setObject(data["data"]["last_name"].string, forKey: "user_name")
                            NSUserDefaults.standardUserDefaults().synchronize()    
                        }
                        // In loi
                                        
                }
                
            }
        } else if sender == skipButton{
            backToMap()
        }
    }
    
    func backToMap() {
        let containerController = self.storyboard?.instantiateViewControllerWithIdentifier("containerController") as! SWRevealViewController
        self.presentViewController(containerController, animated: true, completion: nil)
    }
}




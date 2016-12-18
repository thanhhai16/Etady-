//
//  SignUpController.swift
//  Etady
//
//  Created by trung on 11/15/16.
//  Copyright © 2016 IDNsystems. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var signupButton: UIButton!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var skipButton: UIButton!
    @IBOutlet weak var backButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add butotn listener
        signupButton.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        skipButton.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: .TouchUpInside)
        backButton.addTarget(self, action: #selector(self.buttonTapped(_:)), forControlEvents: .TouchUpInside)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func hideKeyboard(sender: AnyObject) {
        userName.endEditing(true)
        firstName.endEditing(true)
        lastName.endEditing(true)
        email.endEditing(true)
        phoneNumber.endEditing(true)
        password.endEditing(true)
        
    }
    
    func buttonTapped(sender: UIButton){
        if sender==skipButton{
            backToMap()
        }
        
    }
    
    func backToMap() {
        let containerController = self.storyboard?.instantiateViewControllerWithIdentifier("containerController") as! SWRevealViewController
        self.presentViewController(containerController, animated: true, completion: nil)
    }
    
    
}

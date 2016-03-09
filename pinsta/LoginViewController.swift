//
//  LoginViewController.swift
//  pinsta
//
//  Created by Himank Yadav on 3/6/16.
//  Copyright © 2016 himankyadav. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var signInButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    @IBAction func onSignIn(sender: AnyObject) {
        
        PFUser.logInWithUsernameInBackground(usernameField.text!, password: passwordField.text!) { (user:PFUser?, error:NSError?) -> Void in
            if user != nil {
                print("logged in")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
        }
        
    }
    @IBAction func onSignUp(sender: AnyObject) {
        let newUser = PFUser()
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        newUser.signUpInBackgroundWithBlock { (success:Bool, error:NSError?) -> Void in
            if success {
                print("sign up successful")
                self.performSegueWithIdentifier("loginSegue", sender: nil)
            }
            else{
                print(error?.localizedDescription)
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        beautify()
    }
    
    func beautify(){
        logoImage.image = UIImage(named: "logo")
        let appColor = UIColor(red: 0, green: 0.749, blue: 0.749, alpha: 1.0)//UIColor(red: 0, green: 0.9569, blue: 0.749, alpha: 1.0)
        self.view.backgroundColor = appColor
        signInButton.backgroundColor = UIColor.clearColor()
        signInButton.layer.cornerRadius = 20
        signInButton.layer.borderWidth = 2
        signInButton.layer.borderColor = UIColor.whiteColor().CGColor
        signUpButton.backgroundColor = UIColor.clearColor()
        signUpButton.layer.cornerRadius = 20
        signUpButton.layer.borderWidth = 2
        signUpButton.layer.borderColor = UIColor.whiteColor().CGColor
        
        usernameField.layer.cornerRadius = 15
        usernameField.layer.borderWidth = 1
        usernameField.layer.borderColor = appColor.CGColor
        // Do any additional setup after loading the view.
        
        passwordField.layer.cornerRadius = 15
        passwordField.layer.borderColor = appColor.CGColor
        passwordField.layer.borderWidth = 1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

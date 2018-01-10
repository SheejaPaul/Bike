//
//  LoginViewController.swift
//  Bikes
//
//  Created by Admin on 1/7/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    
    let defaults = UserDefaults.standard
    var emailAddress = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if let email = defaults.string(forKey: "Email"), let password = defaults.string(forKey: "Password") {
            self.emailAddress = email
            self.password = password
            print("Login credentials found!")
            performSegue(withIdentifier: "ShowBikesPage", sender: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonDidTap(_ sender: UIButton) {
        emailAddress = emailText.text!
        password = passwordText.text!
        
        // Save User Login Details
        defaults.set(emailAddress, forKey: "Email")
        defaults.set(password, forKey: "Password")
        print("Saving login credentials..")
        performSegue(withIdentifier: "ShowBikesPage", sender: sender)
    }
    
    
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        //let nextViewController = segue.destination as! BikesTableViewController
        // Pass the selected object to the new view controller.
    }
    

}

//
//  ViewController.swift
//  LoginEmailFirebase
//
//  Created by Carlos Brito on 25/05/16.
//  Copyright © 2016 Carlos Brito. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {

    
    @IBOutlet weak var loginButton: UIButton!
    
    
    @IBOutlet weak var logoutButton: UIButton!
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func loginDidTouch(sender: UIButton) {
        
        FIRAuth.auth()?.createUserWithEmail(emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            
            if error != nil {
                self.login()
            }
            else {
                print("user created / usuario creado")
                self.login()
            }
            
            
        })
    }
    
    

    func login(){
        FIRAuth.auth()?.signInWithEmail(emailTextField.text!, password: passwordTextField.text!, completion: { (user, error) in
            
            if error != nil {
                print ("Incorrect")
            }
            else
            {
                print("Login Success")
                self.loginButton.hidden = true
                self.logoutButton.hidden = false
      
            }
            
        })
    }
    
    
    @IBAction func logoutDidTouch(sender: UIButton) {
        
        do {
         try
            FIRAuth.auth()?.signOut()
            logoutButton.hidden = true
            loginButton.hidden = false
        } catch let error as NSError {
            print("\(error.localizedDescription)")
        }
        
    }
    
    override func viewDidAppear(animated: Bool) {
        
        if FIRAuth.auth()?.currentUser?.uid == nil {
            logoutButton.hidden = false
        } else {
            loginButton.hidden = true
        }
    }

    
    
    
    
    
    
    
    
    
    
    
    
    
    
}


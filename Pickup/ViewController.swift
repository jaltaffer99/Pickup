//
//  ViewController.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/7/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var pickUpLogoImage: UIImageView!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var logInTextLabel: UILabel!
    //@IBOutlet weak var userFriendlyLabel1: UILabel!
    
    var handle: AuthStateDidChangeListenerHandle?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        userNameTextField.delegate = self
        passWordTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // [START auth_listener]
        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
                //
        }
        // [END auth_listener]
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        // [START remove_auth_listener]
        Auth.auth().removeStateDidChangeListener(handle!)
        // [END remove_auth_listener]
    }
    
    
    //MARK: UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // Hide the keyboard.
        textField.resignFirstResponder()
        return true;
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        //na for now
    }
    
    //MARK: Actions
    @IBAction func userRegistrationButton(_ sender: UIButton) {
        self.performSegue(withIdentifier: "createAccountSegue", sender: nil)
    }
    @IBAction func logInUserButton(_ sender: UIButton) {
        let email = userNameTextField.text; print(email ?? "no username given")
        let password = passWordTextField.text; print(password ?? "no password given")
        //Sign in to Firebase
        Auth.auth().signIn(withEmail: email!, password: password!) { (user, error) in
            if error != nil {
                self.logInTextLabel.text = "Incorrect email or Password"
                return
            }
            else if user != nil {
                self.performSegue(withIdentifier: "conditionalLoginSegue", sender: nil)
                
            }
        }
    }

    
}


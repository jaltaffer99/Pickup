//
//  RegistrationViewController.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/9/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class RegistrationViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var welcomeUILabel: UILabel!
    @IBOutlet weak var confirmPassWordTextField: UITextField!
    @IBOutlet weak var passWordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        passWordTextField.delegate = self
        confirmPassWordTextField.delegate = self
        userNameTextField.delegate = self
        nameTextField.delegate = self
        welcomeUILabel.numberOfLines = 0
        welcomeUILabel.lineBreakMode = NSLineBreakMode.byWordWrapping
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    // MARK: Actions
    @IBAction func createAccountButton(_ sender: Any) {
        if userNameTextField!.text != "" || nameTextField!.text  != "" {
            let newUser = confirmPassWordTextField.text == passWordTextField.text ? User(name: nameTextField.text!, userName: userNameTextField.text!, passWord: passWordTextField.text!) : nil
            //Add user to Firebase
            Auth.auth().createUser(withEmail: userNameTextField.text!, password: passWordTextField.text!) { (authResult, error) in
                // ...
            }
            if newUser == nil {
                welcomeUILabel.text = "Passwords did not match!"
            }
            else {
                welcomeUILabel.text = "Success! New user " + newUser!.userName + " created!"
            }
        }
        else
        {
            welcomeUILabel.text = "Please fill in the requisite fields to start finding nearby events"
        }
    }
}


//
//  ChannelCreationViewController.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/13/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class ChannelCreationViewController: UIViewController, UITextFieldDelegate {
    //MARK: Properties
    @IBOutlet weak var nameTextField: UITextField!
    
    //Database initialization
    var ref: DatabaseReference!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference().child("channels")
        nameTextField.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func addChannel(name:String?) {
    let key = ref.childByAutoId().key
    let channel = ["id": key,
                    "channelName":name]
    ref.child(key).setValue(channel)
    }
    
    //MARK: Actions
    @IBAction func ChannelCreationButton(_ sender: UIButton) {
        let channelName: String
        if !(nameTextField.text?.isEmpty)!{
            channelName = nameTextField.text!
            addChannel(name: channelName)
            self.performSegue(withIdentifier: "channelCreatedSegue", sender: nil)
        }
        

        
    }
}

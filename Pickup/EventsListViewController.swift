//
//  EventsListViewController.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/15/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit
import Firebase
class EventsListViewController:UIViewController {
    //MARK: Properties
    
    //login listener
    var handle: AuthStateDidChangeListenerHandle?
    //database initialization
    var ref: DatabaseReference!
    //list of events
    var eventList: [Event]!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        ref =  Database.database().reference().child("events")
        ref.queryOrdered(byChild: "channel").queryEqual(toValue: "All").observeSingleEvent(of: .value, with: { snapshot in
            print(snapshot)
            //convert snapshot data into event class data and add it to the list!
        })
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

    //MARK: Actions
}


//
//  Event.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/11/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit

class Event {
    //MARK: Properties
    var id: Int
    var name: String
    var details: String
    var location: String
    var owner: User
    var attendees: [User]
    var date: Date
    
    
    //MARK: Initialization
    init?(id: Int?, name: String, details: String, location: String, owner:User?, attendees: [User], date: Date?) {
        // Initialize stored properties.
        if (id == nil) {
            return nil
        }
        self.id = id!
        self.name = !name.isEmpty ? name : "Event"
        self.details = !details.isEmpty ? details : "This is an event"
        self.location = !location.isEmpty ? location : "NA"
        self.attendees = !attendees.isEmpty ? attendees: []
        if (date == nil) {
            return nil
        }
        self.date = date!
        if (owner == nil){
            return nil
        }
        self.owner = owner!
        }
}

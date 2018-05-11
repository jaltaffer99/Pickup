//
//  Channel.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/11/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit

class Channel {
    //MARK: Properties
    var name: String
    var eventIds: [Int]
    
    //MARK: Initialization
    init?(name: String, eventIds: [Int]) {
        // Initialize stored properties.
        self.eventIds = !eventIds.isEmpty ? eventIds : []
        self.name = !name.isEmpty ? name : "NA"
        
        
    }
}

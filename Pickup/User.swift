//
//  User.swift
//  Pickup
//
//  Created by Jordan Altaffer on 5/8/18.
//  Copyright © 2018 Jordan Altaffer. All rights reserved.
//

import UIKit
class User {
    
    //MARK: Properties
    var name: String
    var userName: String
    var passWord: String
    var userId: Int

    //MARK: Initialization
    
    init?(name: String, userName: String, passWord: String, userId:Int?) {
        // Initialize stored properties.
        if name.isEmpty {
            return nil
        }
        self.name = name;
        if userName.isEmpty {
            return nil
        }
        self.userName = userName
        if passWord.isEmpty {
            return nil
        }
        self.passWord = passWord
        if userId == nil {
            return nil
        }
        self.userId = userId!
        
    }
}

//
//  User.swift
//  Pets
//
//  Created by Erick Martins on 13/11/21.
//

import Foundation

class User{
    
    let name: String
    let email: String
    let password: String
    
    init(name: String, email: String, password: String) {
        self.name = name
        self.email = email
        self.password = password
    }
}

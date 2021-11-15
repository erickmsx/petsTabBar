//
//  User.swift
//  Pets
//
//  Created by Erick Martins on 13/11/21.
//

import UIKit

class User{
    
    let name: String
    let email: String
    let password: String
    let image: UIImage
    var petList: [Pet] = []
    
    init(name: String, email: String, password: String, image: UIImage) {
        self.name = name
        self.email = email
        self.password = password
        self.image = image
    }
}

//
//  User.swift
//  MultiscreenDemo
//
//  Created by Tech on 2024-02-07.
//

import Foundation


class User : CustomStringConvertible, ObservableObject{
    
    @Published var email : String
//    var email: String
    var password : String
    var name : String
    var phoneNumber : String
    var description: String{
        return ("User - Name : \(self.name), Email : \(self.email), Password : \(self.password), Phone Number : \(self.phoneNumber)")
    }
    
    init(email: String, password: String, name: String, phoneNumber: String) {
        self.email = email
        self.password = password
        self.name = name
        self.phoneNumber = phoneNumber
    }
    
    init(){
        self.email = "NA"
        self.password = "NA"
        self.name = "NA"
        self.phoneNumber = "NA"
    }
}

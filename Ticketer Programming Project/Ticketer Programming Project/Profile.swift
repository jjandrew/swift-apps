//
//  Profile.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

struct profile {
    static var userName: String = ""
    static var userBirthdayDate = Date()
    static var userBirthdayString: String = ""
    static var userGender: String = ""
    static var userLocation: String? = nil
    static var userAge: Int? = nil
    static var savedEvents: [Event] = []
    static var attendingEvents: [Event] = []
    static var loggedIn: Bool = false
    
    func changeName(newName: String) {
    }
    func changeBirthday(newBirthday: String) {
    }
    func changeGender(newGender: String) {
    }
    func changeAge() {
    }
    
}




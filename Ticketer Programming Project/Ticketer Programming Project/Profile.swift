//
//  Profile.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class Profile {
    var userName: String
    var userBirthday: String
    var userGender: String
    var userLocation: String?
    var userAge: Int
    var savedEvents: [Event]
    var attendingEvents: [Event]
    
    init(userName: String, userBirthday: String, userGender: String, userLocation: String?, userAge: Int, savedEvents: [Event], attendingEvents: [Event]) {
        self.userName = userName
        self.userBirthday = userBirthday
        self.userGender = userGender
        self.userLocation = userLocation
        self.userAge = userAge
        self.savedEvents = savedEvents
        self.attendingEvents = attendingEvents
    }
    
    func changeName(newName: String) {
    }
    func changeBirthday(newBirthday: String) {
    }
    func changeGender(newGender: String) {
    }
    func changeAge() {
    }
    
}

//
//  Profile.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class profile {
    static var userName: String?
    static var userBirthday: String?
    static var userGender: String?
    static var userLocation: String?
    static var userAge: Int?
    static var savedEvents: [Event] = []
    static var attendingEvents: [Event] = []
    
    init(userName: String?, userBirthday: String?, userGender: String?, userLocation: String?, userAge: Int?, savedEvents: [Event], attendingEvents: [Event]) {
        profile.self.userName = userName
        profile.self.userBirthday = userBirthday
        profile.self.userGender = userGender
        profile.self.userLocation = userLocation
        profile.self.userAge = userAge
        profile.self.savedEvents = savedEvents
        profile.self.attendingEvents = attendingEvents
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

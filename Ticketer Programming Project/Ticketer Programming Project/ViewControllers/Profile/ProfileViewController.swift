//
//  ProfileViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 27/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var birthdayLabel: UILabel!
    @IBOutlet var genderLabel: UILabel!

    @IBOutlet var leftHandInterestedEvent: UILabel!
    @IBOutlet var rightHandInterestedEvent: UILabel!
    @IBOutlet var leftHandAttendingEvent: UILabel!
    @IBOutlet var rightHandAttendingEvent: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var profile = Profile(userName: "Firstname, Surname", userBirthday: "01/01/2003", userGender: "Male", userLocation: nil, userAge: 17, savedEvents: [], attendingEvents: [])
        leftHandInterestedEvent.text = """
        Event Title
        
        Location
        
        Date
        
        Availability
        """
        rightHandInterestedEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        leftHandAttendingEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        rightHandAttendingEvent.text = """
        Event Title
                
        Location
                
        Date
                
        Availability
        """
        nameLabel.text = "Name: \(profile.userName)"
        birthdayLabel.text = "Birthday: \(profile.userBirthdayString)"
        genderLabel.text = "Gender: \(profile.userGender)"
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editProfileButton(_ sender: Any) {
    }
    @IBAction func suggestedMoreButton(_ sender: Any) {
    }
    @IBAction func suggestedPrevButton(_ sender: Any) {
    }
    @IBAction func suggestedNextButton(_ sender: Any) {
    }
    @IBAction func attendingMoreButton(_ sender: Any) {
    }
    @IBAction func attendingPrevButton(_ sender: Any) {
    }
    @IBAction func attendingNextButton(_ sender: Any) {
    }
    
}

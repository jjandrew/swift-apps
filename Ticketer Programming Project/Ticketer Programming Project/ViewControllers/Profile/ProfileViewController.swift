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
        nameLabel.text = "Name: \(profile.userName)"
        birthdayLabel.text = "Birthday: \(profile.userBirthdayString)"
        genderLabel.text = "Gender: \(profile.userGender)"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        displaySavedEvents(index: 0)
        displayAttendingEvents(index: 0)
    }
    
    
    @IBAction func editProfileButton(_ sender: Any) {
    }
    @IBAction func interestedMoreButton(_ sender: Any) {
    }
    @IBAction func interestedPrevButton(_ sender: Any) {
    }
    @IBAction func interestedNextButton(_ sender: Any) {
    }
    @IBAction func attendingMoreButton(_ sender: Any) {
    }
    @IBAction func attendingPrevButton(_ sender: Any) {
    }
    @IBAction func attendingNextButton(_ sender: Any) {
    }
    
    func displaySavedEvents(index: Int) {
        if profile.savedEvents.count > index+1 {
            leftHandInterestedEvent.text = """
            \(profile.savedEvents[index].eventName)
            
            Venue
            
            \(profile.savedEvents[index].date)
            """
            
            rightHandInterestedEvent.text = """
            \(profile.savedEvents[index+1].eventName)
            
            Venue
            
            \(profile.savedEvents[index+1].date)
            """
        } else if profile.savedEvents.count > index {
            leftHandInterestedEvent.text = """
            \(profile.savedEvents[index].eventName)
            
            Venue
            
            \(profile.savedEvents[index].date)
            """
            
            rightHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        } else {
            leftHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
            
            rightHandInterestedEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        }
    }
    
    func displayAttendingEvents(index: Int) {
        if profile.attendingEvents.count > index+1 {
            leftHandAttendingEvent.text = """
            \(profile.attendingEvents[index].eventName)
            
            Venue
            
            \(profile.attendingEvents[index].date)
            """
            
            rightHandAttendingEvent.text = """
            \(profile.attendingEvents[index+1].eventName)
            
            Venue
            
            \(profile.attendingEvents[index+1].date)
            """
        } else if profile.attendingEvents.count > index {
            leftHandAttendingEvent.text = """
            \(profile.attendingEvents[index].eventName)
            
            Venue
            
            \(profile.attendingEvents[index].date)
            """
            
            rightHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        } else {
            leftHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
            
            rightHandAttendingEvent.text = """
            Event Name
            
            Venue
            
            Date
            """
        }
    }
}

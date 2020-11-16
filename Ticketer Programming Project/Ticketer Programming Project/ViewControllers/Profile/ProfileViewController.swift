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
    @IBOutlet var interestedMoreButton: UIButton!
    @IBOutlet var previousInterestedEvent: UIButton!
    @IBOutlet var nextInterestedEvent: UIButton!
    @IBOutlet var attendingMoreButton: UIButton!
    @IBOutlet var previousAttendingEvent: UIButton!
    @IBOutlet var nextAttendingEvent: UIButton!
    
    
    var savedIndex = 0
    var attendingIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(profile.userName)"
        birthdayLabel.text = "Birthday: \(profile.userBirthdayString)"
        genderLabel.text = "Gender: \(profile.userGender)"
        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        savedIndex = 0
        attendingIndex = 0
        displaySavedEvents(index: savedIndex)
        displayAttendingEvents(index: attendingIndex)
    }
    
    
    @IBAction func editProfileButton(_ sender: Any) {
    }
    @IBAction func interestedMoreButtonAction(_ sender: Any) {
    }
    @IBAction func interestedPrevButton(_ sender: Any) {
        savedIndex -= 1
        displaySavedEvents(index: savedIndex)
    }
    @IBAction func interestedNextButton(_ sender: Any) {
        savedIndex += 1
        displaySavedEvents(index: savedIndex)
    }
    @IBAction func attendingMoreButtonAction(_ sender: Any) {
    }
    
    @IBAction func attendingPrevButton(_ sender: Any) {
        attendingIndex -= 1
        displayAttendingEvents(index: attendingIndex)
    }
    @IBAction func attendingNextButton(_ sender: Any) {
        attendingIndex += 1
        displayAttendingEvents(index: attendingIndex)
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
        if index == 0 {
            previousInterestedEvent.isEnabled = false
        } else {
            previousInterestedEvent.isEnabled = true
        }
        if profile.savedEvents.count <= index+2 {
            nextInterestedEvent.isEnabled = false
        } else {
            nextInterestedEvent.isEnabled = true
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
        if index == 0 {
            previousAttendingEvent.isEnabled = false
        } else {
            previousAttendingEvent.isEnabled = true
        }
        if profile.attendingEvents.count <= index+2 {
            nextAttendingEvent.isEnabled = false
        } else {
            nextAttendingEvent.isEnabled = true
        }
    }
}

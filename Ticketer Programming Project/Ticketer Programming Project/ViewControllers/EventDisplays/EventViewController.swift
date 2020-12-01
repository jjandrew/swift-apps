//
//  EventViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 04/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import Firebase

class EventViewController: UIViewController {

    @IBOutlet var savedButton: UIButton!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var venueLabel: UILabel!
    @IBOutlet var distanceLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var demographicLabel: UILabel!
    @IBOutlet var purchaseButton: UIButton!
    @IBOutlet var totalInterestedLabel: UILabel!
    @IBOutlet var totalAttendingLabel: UILabel!
    @IBOutlet var averageAttendingLabel: UILabel!
    @IBOutlet var averageInterestedLabel: UILabel!
    @IBOutlet var percentagesInterestedLabel: UILabel!
    @IBOutlet var maleInterestedLabel: UILabel!
    @IBOutlet var femaleInterestedLabel: UILabel!
    @IBOutlet var otherInterestedLabel: UILabel!
    @IBOutlet var percentagesAttendingLabel: UILabel!
    @IBOutlet var maleAttendingLabel: UILabel!
    @IBOutlet var femaleAttendingLabel: UILabel!
    @IBOutlet var otherAttendingLabel: UILabel!
    
    var event: Event!
    let sortAndSearch = SortAndSearch()
    var demographic: Demographic? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets default values for opening view
        savedButton.setImage(UIImage(systemName: "bookmark.fill"), for: .selected)
        savedButton.setImage(UIImage(systemName: "bookmark"), for: .normal)
        navigationItem.title = event.eventName
        dateLabel.text = event.date
        descriptionLabel.text = event.summary
        venueLabel.text = """
        \(event.venue.name)
        \(event.venue.town)
        \(event.venue.country)
        \(event.venue.postCode)
        """
        if sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).1 == true {
            savedButton.isSelected = true
        }
        
        var ref: DocumentReference!
        let db = Firestore.firestore()
        //this will be changed to the identifier of the event
        ref = db.document("events/testevent20201129")
        ref.getDocument() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if querySnapshot?.data() == nil {
                    print("Event not present")
                    self.demographic = nil
                    //create new event
                    //output no events present to screen
                } else {
                    let data = querySnapshot?.data()
                    print("Event present")
                    //create demographic instance
                    self.demographic = Demographic(event: self.event, numberFemaleInterested: data!["numberFemaleInterested"] as! Int, numberMaleInterested: data!["numberMaleInterested"] as! Int, numberOtherInterested: data!["numberOtherInterested"] as! Int, numberFemaleAttending: data!["numberFemaleAttending"] as! Int, numberMaleAttending: data!["numberMaleAttending"] as! Int, numberOtherAttending: data!["numberOtherAttending"] as! Int, totalAgeAttending: data!["totalAgeAttending"] as! Int, totalAgeInterested: data!["totalAgeInterested"] as! Int, totalAttending: data!["totalAttending"] as! Int, totalInterested: data!["totalInterested"] as! Int)
                    self.event.demographic = self.demographic
                }
            }
        }
        
    }
    
    func updateDemographicLabels() {
        if self.demographic == nil {
            self.demographicLabel.text = "No Demographic available"
            self.totalInterestedLabel.isHidden = true
            self.totalAttendingLabel.isHidden = true
            self.averageAttendingLabel.isHidden = true
            self.averageInterestedLabel.isHidden = true
            self.percentagesInterestedLabel.isHidden = true
            self.maleInterestedLabel.isHidden = true
            self.femaleInterestedLabel.isHidden = true
            self.otherInterestedLabel.isHidden = true
            self.percentagesAttendingLabel.isHidden = true
            self.maleAttendingLabel.isHidden = true
            self.femaleAttendingLabel.isHidden = true
            self.otherAttendingLabel.isHidden = true
        } else {
            //output values to screen
            self.demographicLabel.text = "Demographics:"
            self.totalInterestedLabel.isHidden = false
            self.totalAttendingLabel.isHidden = false
            self.averageAttendingLabel.isHidden = false
            self.averageInterestedLabel.isHidden = false
            self.percentagesInterestedLabel.isHidden = false
            self.maleInterestedLabel.isHidden = false
            self.femaleInterestedLabel.isHidden = false
            self.otherInterestedLabel.isHidden = false
            self.percentagesAttendingLabel.isHidden = false
            self.maleAttendingLabel.isHidden = false
            self.femaleAttendingLabel.isHidden = false
            self.otherAttendingLabel.isHidden = false
            self.totalInterestedLabel.text = String(self.demographic!.totalInterested)

            self.totalAttendingLabel.text = String(self.demographic!.totalAttending)
            
            self.averageAttendingLabel.text = String(self.demographic!.calculateAverageAgeAttending())
            
            self.averageInterestedLabel.text = String(self.demographic!.calculateAverageAgeInterested())
            
            //order of demographic.percentages is [malePercentage, femalePercentage, otherPercentage]
            let gendersInterested = self.demographic!.calculateInterestedPercentages()
            self.maleInterestedLabel.text = gendersInterested[0]
            self.femaleInterestedLabel.text = gendersInterested[1]
            self.otherInterestedLabel.text = gendersInterested[2]
            
            let gendersAttending = self.demographic!.calculateAttendingPercentages()
            self.maleAttendingLabel.text = gendersAttending[0]
            self.femaleAttendingLabel.text = gendersAttending[1]
            self.otherAttendingLabel.text = gendersAttending[2]
            //prepare to update demographic
        }
    }

    @IBAction func savedAction(_ sender: Any) {
        //saves and unsaves the event
        if savedButton.isSelected == true {
            //checks location of event in savedEvents
            profile.savedEvents.remove(at: sortAndSearch.eventLinearSearch(events: profile.savedEvents, searchEvent: event).0!)
            savedButton.isSelected = false
        } else {
            savedButton.isSelected = true
            profile.savedEvents.append(event)
        }
        //saves event to local storage
        let defaults = UserDefaults.standard
        if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
            defaults.set(convertedProfile, forKey: "savedProfile")
        }
        if let convertedEvents = try? NSKeyedArchiver.archivedData(withRootObject: profile.savedEvents, requiringSecureCoding: false) {
            defaults.set(convertedEvents, forKey: "savedEvents")
        }
    }
    
    @IBAction func purchaseAction(_ sender: Any) {
        //checks event is present in attending events
        if sortAndSearch.eventLinearSearch(events: profile.attendingEvents, searchEvent: event).1 == false {
            profile.attendingEvents.append(event)
        }
        //stores profile in local storage
        let defaults = UserDefaults.standard
        if let convertedProfile = try? NSKeyedArchiver.archivedData(withRootObject: profile, requiringSecureCoding: false) {
            defaults.set(convertedProfile, forKey: "savedProfile")
        }
        if let convertedEvents = try? NSKeyedArchiver.archivedData(withRootObject: profile.attendingEvents, requiringSecureCoding: false) {
            defaults.set(convertedEvents, forKey: "attendingEvents")
        }
        //opens website in safari
        let website = self.event.website[0]
        UIApplication.shared.open(URL(string: website)!)
    }
}

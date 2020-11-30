//
//  Demographic.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 20/09/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation
import Firebase

class Demographic {
    let db = Firestore.firestore()
    let event: Event
    var numberFemaleInterested: Int
    var numberMaleInterested: Int
    var numberOtherInterested: Int
    var numberFemaleAttending: Int
    var numberMaleAttending: Int
    var numberOtherAttending: Int
    var totalAgeAttending: Int
    var totalAgeInterested: Int
    var totalAttending: Int
    var totalInterested: Int
    
    init(event: Event, numberFemaleInterested: Int, numberMaleInterested: Int, numberOtherInterested: Int, numberFemaleAttending: Int, numberMaleAttending: Int, numberOtherAttending: Int, totalAgeAttending: Int, totalAgeInterested: Int, totalAttending: Int, totalInterested: Int) {
        self.event = event
        self.numberFemaleInterested = numberFemaleInterested
        self.numberMaleInterested = numberMaleInterested
        self.numberOtherInterested = numberOtherInterested
        self.numberFemaleAttending = numberFemaleAttending
        self.numberMaleAttending = numberMaleAttending
        self.numberOtherAttending = numberOtherAttending
        self.totalAgeAttending = totalAgeAttending
        self.totalAgeInterested = totalAgeInterested
        self.totalAttending = totalAttending
        self.totalInterested = totalInterested
    }
    
    
    
    func calculateAverageAgeInterested() -> String {
        let average = totalAgeInterested/totalInterested
        return String(format: "%.2f", average)
    }
    
    func calculateAverageAgeAttending() -> String {
        let average = totalAgeAttending/totalAttending
        return String(format: "%.2f", average)
    }
    
    func calculateInterestedPercentages() -> [String] {
        var percentageArray: [String] = []
        //will calculate percentage for each and make to 0 decimal places
        let malePercentage = (numberMaleInterested/totalInterested)*100
        percentageArray.append(String(format: "%.0f", malePercentage))
        let femalePercentage = (numberFemaleInterested/totalInterested)*100
        percentageArray.append(String(format: "%.0f", femalePercentage))
        let otherPercentage = (numberOtherInterested/totalInterested)*100
        percentageArray.append(String(format: "%.0f", otherPercentage))
        //will return array in format [malePercentage, femalePercentage, otherPercentage]
        return percentageArray
    }
    
    func calculateAttendingPercentages() -> [String] {
        var percentageArray: [String] = []
        //will calculate percentage for each and make to 0 decimal places
        let malePercentage = (numberMaleAttending/totalAttending)*100
        percentageArray.append(String(format: "%.0f", malePercentage))
        let femalePercentage = (numberFemaleAttending/totalAttending)*100
        percentageArray.append(String(format: "%.0f", femalePercentage))
        let otherPercentage = (numberOtherAttending/totalAttending)*100
        percentageArray.append(String(format: "%.0f", otherPercentage))
        //will return array in format [malePercentage, femalePercentage, otherPercentage]
        return percentageArray
    }
    
    
    
    
    func checkDocumentPresent() {
        var ref: DocumentReference!
        let db = Firestore.firestore()
        //this will be changed to the identifier of the event
        ref = db.document("events/testEvent")
        ref.getDocument() { (querySnapshot, error) in
            if let error = error {
                print("Error getting documents: \(error)")
            } else {
                if querySnapshot?.data() == nil {
                    print("Event not present")
                    //create new event
                } else {
                    print("Event present")
                    //create demographic instance
                    //prepare to update demographic
                }
            }
        }
    }
    
    func createDocumentInterested() {
        var ref: DocumentReference!
        ref = Firestore.firestore().document("events/\(self.event.identifier)")
        if profile.userGender == "Male" {
            let data: [String: Any] = [
                "numberFemaleInterested": 0,
                "numberMaleInterested": 1,
                "numberOtherInterested": 0,
                "numberFemaleAttending": 0,
                "numberMaleAttending": 0,
                "numberOtherAttending": 0,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else if profile.userGender == "Female" {
            let data: [String: Any] = [
                "numberFemaleInterested": 1,
                "numberMaleInterested": 0,
                "numberOtherInterested": 0,
                "numberFemaleAttending": 0,
                "numberMaleAttending": 0,
                "numberOtherAttending": 0,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else {
            let data: [String: Any] = [
                "numberFemaleInterested": 0,
                "numberMaleInterested": 0,
                "numberOtherInterested": 1,
                "numberFemaleAttending": 0,
                "numberMaleAttending": 0,
                "numberOtherAttending": 0,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
        
    }
    
    func createDocumentAttending() {
        var ref: DocumentReference!
        ref = Firestore.firestore().document("events/\(self.event.identifier)")
        if profile.userGender == "Male" {
            let data: [String: Any] = [
                "numberFemaleInterested": 0,
                "numberMaleInterested": 0,
                "numberOtherInterested": 0,
                "numberFemaleAttending": 0,
                "numberMaleAttending": 1,
                "numberOtherAttending": 0,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else if profile.userGender == "Female" {
            let data: [String: Any] = [
                "numberFemaleInterested": 0,
                "numberMaleInterested": 0,
                "numberOtherInterested": 0,
                "numberFemaleAttending": 1,
                "numberMaleAttending": 0,
                "numberOtherAttending": 0,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else {
            let data: [String: Any] = [
                "numberFemaleInterested": 0,
                "numberMaleInterested": 0,
                "numberOtherInterested": 0,
                "numberFemaleAttending": 0,
                "numberMaleAttending": 0,
                "numberOtherAttending": 1,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]
            ref.setData(data) { error in
                if let error = error {
                    print("Error adding document: \(error)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
    }
}

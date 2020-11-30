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
    
    func checkDocumentPresent() {
        db.collection("events").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    func createDocumentInterested() {
        var ref: DocumentReference? = nil
        if profile.userGender == "Male" {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 0,
                "numberMale": 1,
                "numberOther": 0,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else if profile.userGender == "Female" {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 1,
                "numberMale": 0,
                "numberOther": 0,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 0,
                "numberMale": 0,
                "numberOther": 1,
                "totalAgeAttending": 0,
                "totalAgeInterested": profile.userAge!,
                "totalAttending": 0,
                "totalInterested": 1
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
        
    }
    
    func createDocumentAttending() {
        var ref: DocumentReference? = nil
        if profile.userGender == "Male" {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 0,
                "numberMale": 1,
                "numberOther": 0,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else if profile.userGender == "Female" {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 1,
                "numberMale": 0,
                "numberOther": 0,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        } else {
            ref = db.collection("events").addDocument(data: [
                "numberFemale": 0,
                "numberMale": 0,
                "numberOther": 1,
                "totalAgeAttending": profile.userAge!,
                "totalAgeInterested": 0,
                "totalAttending": 1,
                "totalInterested": 0
            ]) { err in
                if let err = err {
                    print("Error adding document: \(err)")
                } else {
                    print("Document added with ID: \(ref!.documentID)")
                }
            }
        }
    }
}

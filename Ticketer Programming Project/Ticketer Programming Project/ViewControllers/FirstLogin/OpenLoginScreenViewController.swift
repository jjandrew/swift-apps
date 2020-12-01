//
//  OpenLoginScreenViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 29/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit
import Firebase

class OpenLoginScreenViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
                    //create new event
                } else {
                    print("Event present")
                    //create demographic instance
                    var demographic = Demographic(event: <#T##Event#>, numberFemaleInterested: <#T##Int#>, numberMaleInterested: <#T##Int#>, numberOtherInterested: <#T##Int#>, numberFemaleAttending: <#T##Int#>, numberMaleAttending: <#T##Int#>, numberOtherAttending: <#T##Int#>, totalAgeAttending: <#T##Int#>, totalAgeInterested: <#T##Int#>, totalAttending: <#T##Int#>, totalInterested: <#T##Int#>)
                    //prepare to update demographic
                }
            }
        }
    }
    
}

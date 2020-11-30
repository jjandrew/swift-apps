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
        ref = Firestore.firestore().document("events/testEvent2")
        let data: [String: Any] = [
            "numberFemale": 0,
            "numberMale": 1,
            "numberOther": 0,
            "totalAgeAttending": 0,
            "totalAgeInterested": 26,
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

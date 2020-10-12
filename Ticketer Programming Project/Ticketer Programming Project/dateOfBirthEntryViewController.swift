//
//  dateOfBirthEntryViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 07/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class dateOfBirthEntryViewController: UIViewController {

    @IBOutlet var dateOfBirthPicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func entryButton(_ sender: Any) {
        performSegue(withIdentifier: "DOBToGender", sender: self)
    }

    @IBAction func dateOfBirthAction(_ sender: Any) {
    }

}

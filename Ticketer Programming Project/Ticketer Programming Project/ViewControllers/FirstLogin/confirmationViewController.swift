//
//  confirmationViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 07/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class confirmationViewController: UIViewController {


    @IBOutlet var nameLabel: UILabel!
    
    @IBOutlet var dateOfBirthLabel: UILabel!
    
    @IBOutlet var genderLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = profile.userName
        dateOfBirthLabel.text = profile.userBirthday
        genderLabel.text = profile.userGender
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        performSegue(withIdentifier: "confirmToHome", sender: self)
    }

}

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
        dateOfBirthLabel.text = profile.userBirthdayString
        genderLabel.text = profile.userGender
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        profile.loggedIn = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        performSegue(withIdentifier: "confirmToHome", sender: self)
        //save profile to local storage
    }
    
}




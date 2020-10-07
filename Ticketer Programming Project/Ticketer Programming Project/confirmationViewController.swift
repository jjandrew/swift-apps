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

        // Do any additional setup after loading the view.
    }
    
    @IBAction func confirmButton(_ sender: Any) {
        performSegue(withIdentifier: "confirmToHome", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

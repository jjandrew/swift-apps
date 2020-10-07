//
//  nameEntryViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 07/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class nameEntryViewController: UIViewController {

    @IBOutlet var textEntryField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func entryButtonAction(_ sender: Any) {
        performSegue(withIdentifier: "nameToDOB", sender: self)
    }

    
}

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
    }
    
    @IBAction func entryButtonAction(_ sender: Any) {
        let validationResult = validateTextEntry(entry: textEntryField.text)
        if validationResult == true {
            global var userName = textEntryField.text
            performSegue(withIdentifier: "nameToDOB", sender: self)
        } else {
            let alert = UIAlertController(title: "Please Enter more than two characters of text", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func validateTextEntry(entry: String?) -> Bool {
        if entry != nil {
            if entry!.count > 2 {
                return true
            } else {
                return false
            }
        } else {
            return false
        }
    }
    
}
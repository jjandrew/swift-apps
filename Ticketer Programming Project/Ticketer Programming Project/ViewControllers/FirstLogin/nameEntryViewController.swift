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
        let sortAndSearch = SortAndSearch()
        let test1Data = [Event(eventName: "bbf", location: nil, date: "20/01/2022", description: "", saved: nil, website: []), Event(eventName: "abc", location: nil, date: "01/05/2020", description: "", saved: nil, website: []), Event(eventName: "dfa", location: nil, date: "08/02/2020", description: "", saved: nil, website: []), Event(eventName: "bbf", location: nil, date: "01/01/2020", description: "", saved: nil, website: [])]
        let i = sortAndSearch.quickSortByDate(array: test1Data)
        for s in i {
            print(s.date)
        }
    }
    
    @IBAction func entryButtonAction(_ sender: Any) {
        let validationResult = validateTextEntry(entry: textEntryField.text)
        if validationResult == true {
            let nameArray = textEntryField.text!.split(separator: " ")
            profile.userName = "\(nameArray[0]) \(nameArray[1])"
            performSegue(withIdentifier: "nameToDOB", sender: self)
        } else {
            let alert = UIAlertController(title: "Please Enter more than two characters of text in each part of your name", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func validateTextEntry(entry: String?) -> Bool {
        if entry != nil {
            if let nameArray = entry?.split(separator: " ") {
                if nameArray.count == 2 {
                    if nameArray[0].count > 1 {
                        if nameArray[1].count > 2 {
                            return true
                        }
                    }
                }
            }
        }
        return false
    }
    
}

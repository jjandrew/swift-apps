//
//  EditProfileViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 16/11/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet var nameEntryTextField: UITextField!
    @IBOutlet var dateOfBirthPicker: UIDatePicker!
    
    let currentDate = Date()
    let calendar = Calendar.current
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //sets up UI
        nameEntryTextField.placeholder = profile.userName
        dateOfBirthPicker.date = profile.userBirthdayDate
    }
    
    
    @IBAction func confirmButton(_ sender: Any) {
        var validate = 0
        var birthdayDate: Date? = nil
        var age = 0
        var birthdayString = ""
        var name = ""
        
        let dOfB = dateOfBirthPicker.date
        let userAge = calculateAge(dOfB: dOfB)
        //performs validation on age
        if userAge > 4 && userAge < 126 {
            //puts date into constant format
            birthdayDate = dOfB
            age = userAge
            let dOfBDayInt = calendar.component(.day, from: dOfB)
            var dOfBDayString = ""
            if dOfBDayInt < 10 {
                dOfBDayString = "0\(dOfBDayInt)"
            } else {
                dOfBDayString = String(dOfBDayInt)
            }
            let dOfBMonthInt = calendar.component(.month, from: dOfB)
            var dOfBMonthString = ""
            if dOfBMonthInt < 10 {
                dOfBMonthString = "0\(dOfBMonthInt)"
            } else {
                dOfBMonthString = String(dOfBDayInt)
            }
            let dOfBYear = calendar.component(.year, from: dOfB)
            birthdayString = "\(dOfBDayString)/\(dOfBMonthString)/\(dOfBYear)"
            
        } else {
            validate += 1
        }
        
        let validationResult = validateNameEntry(entry: nameEntryTextField.text)
        if validationResult == true {
            let nameArray = nameEntryTextField.text!.split(separator: " ")
            name = "\(nameArray[0]) \(nameArray[1])"
        } else {
            validate += 2
        }
        
        //checks what message to display to a user
        if validate == 0 {
            let alert = UIAlertController(title: "Profile successfully updated", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
            profile.userBirthdayDate = birthdayDate!
            profile.userAge = age
            profile.userName = name
            profile.userBirthdayString = birthdayString
            
        } else if validate == 1 {
            let alert = UIAlertController(title: "I'm sorry your age means you are not elligable for using our application", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else if validate == 2 {
            let alert = UIAlertController(title: "Please Enter more than two characters of text in each part of your name", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
            let alert = UIAlertController(title: "Please Enter valid inputs for both name and age", message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    func calculateAge(dOfB: Date) -> Int {
        return Calendar.current.dateComponents([.year], from: dOfB, to: currentDate).year ?? 0
    }
    
    func validateNameEntry(entry: String?) -> Bool {
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
    
    
    @IBAction func maleButton(_ sender: Any) {
        profile.userGender = "Male"
        let alert = UIAlertController(title: "Gender changed to Male", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        profile.userGender = "Female"
        let alert = UIAlertController(title: "Gender changed to Female", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    @IBAction func otherButton(_ sender: Any) {
        profile.userGender = "Other"
        let alert = UIAlertController(title: "Gender changed to Other", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
}

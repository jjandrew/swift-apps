//
//  ViewController.swift
//  CommentCardWriter
//
//  Created by Andrew, James (NA) on 11/02/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var SubjectLabel: UILabel!
    @IBOutlet var progressText: UITextField!
    @IBOutlet var challengeText: UITextField!
    @IBOutlet var enjoymentSlider: UISlider!
    @IBOutlet var progressSlider: UISlider!
    @IBOutlet var enjoymentValue: UILabel!
    @IBOutlet var progressValue: UILabel!
    @IBOutlet var removeChallengeOutlet: UIButton!
    @IBOutlet var challengeArrayLabel: UILabel!
    @IBOutlet var characterCountLabel: UILabel!
    @IBOutlet var addChallengeOutlet: UIButton!
    @IBOutlet var commentTextView: UITextView!
    
    var challengeArray: [String] = []
    let maxLength = 300
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let student = addDummyData()
        changeLabel(student: student)
        // Do any additional setup after loading the view.
        removeChallengeOutlet.isHidden = true
        commentTextView.isHidden = true
        challengeArrayLabel.isHidden = true
        characterCountLabel.isHidden = true
        
    }

    func addDummyData() -> Student{
        let name = "Sam"
        let subjects = [Subject(subjectName: "Maths", beak: "DJB"), Subject(subjectName: "Economics", beak: "TGS")]
        let student = Student(name: name, subjects: subjects)
        return student
    }
    
    func changeLabel(student: Student) {
        SubjectLabel.text = student.subjects[0].subjectName
    }

    @IBAction func enjoymentChanged(_ sender: UISlider) {
        let myString = String(format: "%1.0f", sender.value)
        enjoymentValue.text = myString
    }
    
    @IBAction func progressChanged(_ sender: UISlider) {
        let myString = String(format:  "%1.0f", sender.value)
        progressValue.text = myString
    }
    
    @IBAction func generate(_ sender: Any) {
        let enjoyment = enjoymentValue.text
        let progress = progressValue.text
        let enjoymentInt = Int(enjoyment!)!
        let progressInt = Int(progress!)!
        let student = addDummyData()
        if challengeArray != [] {
            let comment = Comment(enjoyment: enjoymentInt, progress: progressInt, challenges: challengeArray, subject: student.subjects[0])
            comment.commentCompiler()
            characterCountLabel.text = String(comment.comment.count) + " Characters"
            commentTextView.text = comment.comment
            commentTextView.isHidden = false
            characterCountLabel.isHidden = false
            challengeArrayLabel.isHidden = true
        } else {
            let alert = UIAlertController(title: "Error", message: "Please enter at least one challenge.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        }
    }
    
    
    @IBAction func addChallenge(_ sender: Any) {
        if challengeText.text == "" {
            let alert = UIAlertController(title: "Error", message: "Please enter a challenge", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } else {
//           var challengeList: String
            let enjoyment = enjoymentValue.text
            let progress = progressValue.text
            let enjoymentInt = Int(enjoyment!)!
            let progressInt = Int(progress!)!
            let student = addDummyData()
            var commentLength = 0
            if challengeArray.count > 0 {
                let commentCharacters = Comment(enjoyment: enjoymentInt, progress: progressInt, challenges: challengeArray, subject: student.subjects[0])
                commentCharacters.commentCompiler()
                commentLength = commentCharacters.comment.count
            } else {
                let commentCharacters = Comment(enjoyment: enjoymentInt, progress: progressInt, challenges: [""], subject: student.subjects[0])
                commentCharacters.commentCompiler()
                commentLength = commentCharacters.comment.count
            }
            for _ in challengeArray {
                commentLength += 1
            }
            if commentLength + challengeText.text!.count + 2 <= maxLength {
                challengeArray.append(challengeText.text!)
                challengeText.text = ""
                removeChallengeOutlet.isHidden = false
                challengeArrayLabel.isHidden = false
            } else {
                let alert = UIAlertController(title: "Error", message: "You have exceded the word count", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(alert, animated: true)
            }
        }
        var challenges = ""
        for challenge in challengeArray {
            challenges += challenge + ", "
        }
        challenges = String(challenges.dropLast())
        challenges = String(challenges.dropLast())
        challenges += "."
        challengeArrayLabel.text = challenges
    }
    @IBAction func removeChallenge(_ sender: Any) {
        challengeArray.removeLast()
        if challengeArray == [] {
            removeChallengeOutlet.isHidden = true
            challengeArrayLabel.isHidden = true
        }
        var challenges = ""
        for challenge in challengeArray {
            challenges += challenge + ", "
        }
        challenges = String(challenges.dropLast())
        challenges = String(challenges.dropLast())
        challenges += "."
        challengeArrayLabel.text = challenges
    }
}


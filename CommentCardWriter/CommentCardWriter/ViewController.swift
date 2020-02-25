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
    @IBOutlet var enjoymentText: UITextField!
    @IBOutlet var progressText: UITextField!
    @IBOutlet var challengeText: UITextField!
    @IBOutlet var commentLabel: UILabel!
    
    var challengeArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let student = addDummyData()
        changeLabel(student: student)
        // Do any additional setup after loading the view.
        commentLabel.isHidden = true
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

    @IBAction func enjoymentChoice(_ sender: Any) {
    }
    
    @IBAction func generate(_ sender: Any) {
        let enjoyment = enjoymentText.text
        let progress = progressText.text
        if let enjoymentInt = Int(enjoyment!) {
            if let progressInt = Int(progress!) {
                let student = addDummyData()
                if enjoymentInt >= 0 && enjoymentInt <= 3 {
                    if progressInt >= 0 && progressInt <= 3 {
                        let comment = Comment(enjoyment: enjoymentInt, progress: progressInt, challenges: challengeArray, subject: student.subjects[0])
                        comment.commentCompiler()
                        commentLabel.text = comment.comment
                        commentLabel.isHidden = false
                    } else {
                        //display error next to progress for out of range
                    }
                } else {
                    // display error next to enjoyment for our of range
                }
            } else {
                // display error for progress not integer entered
                progressText.text = ""
            }
        } else {
            // display error for enjoyment not integer entered
            enjoymentText.text = ""
        }
    }
    
    @IBAction func progressChoice(_ sender: Any) {
    }
    
    @IBAction func addChallenge(_ sender: Any) {
        challengeArray.append(challengeText.text!)
        challengeText.text = ""
    }
}


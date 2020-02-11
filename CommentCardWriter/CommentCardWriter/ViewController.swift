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
    
    var challengeArray: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let student = addDummyData()
        changeLabel(student: student)
        // Do any additional setup after loading the view.
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
        var enjoyment = enjoymentText.text
        var progress = progressText.text
        enjoyment = Int(enjoyment!)
        progress = Int(progress!)
        let comment = Comment(enjoyment: enjoyment, progress: progress, challenges: challengeArray)
    }
    
    @IBAction func progressChoice(_ sender: Any) {
    }
    
    @IBAction func addChallenge(_ sender: Any) {
        challengeArray.append(challengeText.text!)
    }
}


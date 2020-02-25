//
//  Comment.swift
//  CommentCardWriter
//
//  Created by Andrew, James (NA) on 11/02/2020.
//  Copyright © 2020 Andrew, James (NA). All rights reserved.
//

import Foundation

class Comment {
    var enjoyment: Int
    var progress: Int
    var challenges: [String]
    var subject: Subject
    var comment: String
    
    init(enjoyment: Int, progress: Int, challenges: [String], subject: Subject) {
        self.enjoyment = enjoyment
        self.progress = progress
        self.challenges = challenges
        self.subject = subject
        self.comment = ""
    }
    
    func commentCompiler() {
        var enjoymentComment: String
        if enjoyment == 0 {
            enjoymentComment = "I have found \(subject) tricky this half."
        } else if enjoyment == 1 {
            enjoymentComment = "I have found \(subject) alright this half."
        } else if enjoyment == 2 {
                enjoymentComment = "I have found \(subject) fun this half."
        } else {
            enjoymentComment = "I have found \(subject) really enjoyable this half."
        }
        var progressComment: String
        if progress == 0 {
            progressComment = "I feel that I have gone downhill quite a lot throughout the half."
        } else if progress == 1 {
            progressComment = "I think that I have stayed at roughly the same rate of improvement this half."
        } else if progress == 2 {
            progressComment = "I have felt that I have improved this half."
        } else {
            progressComment = "I think that I have really improved this half."
        }
        var challengeList: String
        var challengeComment: String
        challengeList = challenges[0]
        for i in (1...challenges.count-1) {
            challengeList = challengeList + ", " + challenges[i]
        }
        challengeList += "."
        challengeComment = "The things that I have found challenging this half are: \(challengeList)"
        self.comment = "\(enjoymentComment) \(progressComment) \(challengeComment)"
    }
}

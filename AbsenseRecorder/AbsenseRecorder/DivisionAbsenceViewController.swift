//
//  DivisionAbsenceViewController.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 03/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {

    var division: Division
    var absence: Absence
    
    init?(coder: NSCoder, division: Division, absence: Absence) {
        // what this mean
        self.division = division
        self.absence = absence
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("You must create this Controller with a Division and Absence")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = division.code
        selectRowsForPresentStudents()
        
    }
    
    func selectRowsForPresentStudents() {
        for (position, student) in division.students.enumerated() {
            if absence.absent.contains(student) {
            } else {
                let indexPath = IndexPath(row: position, section: 0)
                tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division.students.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division.students[indexPath.row].surname
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.absent.removeAll {
            $0 == selectedStudent
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        let selectedStudent = division.students[indexPath.row]
        absence.absent.append(selectedStudent)
    }
    
}

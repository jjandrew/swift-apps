//
//  DivisionAbsenceViewController.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 03/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class DivisionAbsenceViewController: UITableViewController {

    var division: Division?
    var absence: Absence?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = division?.code
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return division?.students.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Student", for: indexPath)
        cell.textLabel?.text = division?.students[indexPath.row].surname
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let selectedStudent = division?.students[indexPath.row] {
            absence?.present.append(selectedStudent)
            absence?.absent.removeAll {
                $0.forename == selectedStudent.forename && $0.surname == selectedStudent.surname
                //what exactly does this mean
            }
        }
    }

    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let selectedStudent = division?.students[indexPath.row] {
            absence?.absent.append(selectedStudent)
            absence?.present.removeAll {
                $0.forename == selectedStudent.forename && $0.surname == selectedStudent.surname
            }
        }
    }
    
}

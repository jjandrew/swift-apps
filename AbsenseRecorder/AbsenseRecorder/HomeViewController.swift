//
//  ViewController.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 30/01/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class HomeViewController: UITableViewController {
    
    var divisions: [Division] = []
    var currentDate: Date = Date()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDummyData()
        updateDateDisplay()
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return divisions.count
    }
    
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Division", for: indexPath)
        
        //if divisions[indexPath.row].getAbsence(for: currentDate) != nil {
        //    tableView.selectRow(at: indexPath, animated: false, scrollPosition: .none)
        //}
        //cell.textLabel?.text = divisions[indexPath.row].code
        let selectedDivision = divisions[indexPath.row]
        cell.textLabel?.text = selectedDivision.code
        cell.accessoryType = selectedDivision.getAbsence(for: currentDate) == nil ? .none: .checkmark
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let selectedDivision = divisions[indexPath.row]
       
        var absence = Absence(date: currentDate)
        if let existingAbsence = selectedDivision.getAbsence(for: currentDate) {
            absence = existingAbsence
        } else {
            selectedDivision.absences.append(absence)
        }
        
        guard let vc = storyboard?.instantiateViewController(identifier: "DivisionAbsenceViewController", creator: { coder in
            return DivisionAbsenceViewController(coder: coder, division: selectedDivision, absence: absence)
        }) else {
            fatalError("Failed to load Division Absence View Controller from Storyboard.")
        }
        //what does the storyboard function mean
        //ehst does guard mean
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let allPresent = UIContextualAction(style: .normal, title: "All Present") { action, view, completionHandler in
            let division = self.divisions[indexPath.row]
            let absence = Absence(date: self.currentDate, present: division.students)
            division.absences.append(absence)
            tableView.reloadData()
            completionHandler(true)
        }
        
        allPresent.backgroundColor = UIColor.blue
        return UISwipeActionsConfiguration(actions: [allPresent])
    }

    
    @IBAction func previousDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: -1, to: currentDate) ?? Date()
        //why does it return an optional
        updateDateDisplay()
    }
    
    @IBAction func nextDay(_ sender: Any) {
        currentDate = Calendar.current.date(byAdding: .day, value: 1, to: currentDate) ?? Date()
        //why does it return an optional
        updateDateDisplay()
    }
    
    
    
    fileprivate func updateDateDisplay() {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        //go over enums
        
        navigationItem.title = formatter.string(from: currentDate)
        tableView.reloadData()
    }
    
    
    func addDummyData() {
        divisions.append(DivisionFactory.createDivision(code: "BY-1", of: 8))
        divisions.append(DivisionFactory.createDivision(code: "CW-1", of: 10))
        divisions.append(DivisionFactory.createDivision(code: "CZ-1", of: 6))
    }

}


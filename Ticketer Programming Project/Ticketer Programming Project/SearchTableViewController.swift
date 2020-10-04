//
//  SearchTableViewController.swift
//  Ticketer Programming Project
//
//  Created by JJ Andrew on 04/10/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class SearchTableViewController: UITableViewController {
    
    var events: [Event] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return events.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell")
        cell?.textLabel?.text = events[indexPath.row].eventName
        return cell!
    }

}

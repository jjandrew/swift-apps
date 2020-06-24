//
//  ProfileViewController.swift
//  Bloating Labels
//
//  Created by JJ Andrew on 24/06/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet var totalItems: UILabel!
    @IBOutlet var totalProfit: UILabel!
    @IBOutlet var totalValueStock: UILabel!
    @IBOutlet var potentialProfit: UILabel!
    @IBOutlet var amountSpent: UILabel!
    @IBOutlet var amountSold: UILabel!
    @IBOutlet var numItemsSold: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalItems.text = "14"
        totalProfit.text = "-9.82"
        totalValueStock.text = "395"
        potentialProfit.text = "344.71"
        amountSpent.text = "50.31"
        amountSold.text = "40.47"
        numItemsSold.text = "5"

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

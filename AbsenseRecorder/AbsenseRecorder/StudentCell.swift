//
//  StudentCell.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 05/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class StudentCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .checkmark : .none
        
    }

}

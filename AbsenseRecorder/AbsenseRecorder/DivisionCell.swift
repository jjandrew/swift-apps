//
//  DivisionCell.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 09/02/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import UIKit

class DivisionCell: UITableViewCell {

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        self.accessoryType = selected ? .checkmark : .none
        
        //are these enums
    }

}

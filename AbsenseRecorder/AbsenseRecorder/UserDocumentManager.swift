//
//  UserDocumentManager.swift
//  AbsenseRecorder
//
//  Created by JJ Andrew on 09/03/2020.
//  Copyright © 2020 JJ Andrew. All rights reserved.
//

import Foundation

class UserDocumentManager {
    static func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        
        return paths[0]
    }
}

//
//  ChecklistItem.swift
//  Checklist_Swift1
//
//  Created by Terry Griffin on 2/23/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import Foundation

class ChecklistItem {
    var text = ""
    var checked = true
    
    func toggleChecked(){
        checked = !checked
    }
}


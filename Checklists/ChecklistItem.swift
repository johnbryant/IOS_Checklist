//
//  ChecklistItem.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/11.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import Foundation
class ChecklistItem {
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
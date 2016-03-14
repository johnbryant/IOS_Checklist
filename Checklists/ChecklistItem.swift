//
//  ChecklistItem.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/11.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import Foundation
class ChecklistItem: NSObject, NSCoding{
    var text = ""
    var checked = false
    
    override init() {
        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObjectForKey("Text") as! String
        checked = aDecoder.decodeBoolForKey("Checked")
        super.init()
    }
    
    func toggleChecked() {
        checked = !checked
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(text, forKey: "Text")
        aCoder.encodeBool(checked, forKey: "Checked")
    }
}
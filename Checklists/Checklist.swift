//
//  Checklist.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/14.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import Foundation

class Checklist: NSObject {
    var name = ""
    
    init(name: String) {
        self.name = name
        super.init()
    }
}
//
//  ViewController.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/9.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem", forIndexPath: indexPath)
        let label = cell.viewWithTag(1000) as! UILabel
        
        if indexPath.row%5 == 0 {
            label.text = "walk the dog"
        } else if indexPath.row%5 == 1 {
            label.text = "Brush my teeth"
        } else if indexPath.row%5 == 2 {
            label.text = "Learn iOS development"
        } else if indexPath.row%5 == 3 {
            label.text = "Soccer practice"
        } else if indexPath.row%5   == 4 {
            label.text = "Eat ice cream"
        }
        
        return cell
    }

}


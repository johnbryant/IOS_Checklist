//
//  AddItemViewController.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/11.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import Foundation
import UIKit

class AddItemViewController: UITableViewController {
    
    @IBOutlet weak var textField: UITextField!
    
    
    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func done() {
        print("Contents of text field: \(textField.text)")
        dismissViewControllerAnimated(true, completion: nil)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
}
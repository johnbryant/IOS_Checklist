//
//  AddItemViewController.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/11.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import Foundation
import UIKit

protocol AddItemViewControllerDelegate: class {
    func addItemViewControllerDidCancel(controller: AddItemViewController)
    func addItemViewController(controller: AddItemViewController, didFinishAddingItem item: ChecklistItem)
}

class AddItemViewController: UITableViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    weak var delegate: AddItemViewControllerDelegate?
    
    @IBAction func cancel() {
        // the '?' means do not send the message if the delegate is nil
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done() {
        print("Contents of text field: \(textField.text)")
        let item = ChecklistItem()
        item.text = textField.text!
        delegate?.addItemViewController(self, didFinishAddingItem: item)
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        let oldString: NSString = textField.text!
        let newString: NSString = oldString.stringByReplacingCharactersInRange(range, withString: string)
        doneBarButton.enabled = newString.length > 0
        return true
    }
    
    
    
    
    
    
}
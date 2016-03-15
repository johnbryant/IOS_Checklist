//
//  AllListsViewController.swift
//  Checklists
//
//  Created by JohnBryant on 16/3/14.
//  Copyright © 2016年 JohnBryant. All rights reserved.
//

import UIKit

class AllListsViewController: UITableViewController, ListDetailViewControllerDelegate {

    var lists: [Checklist]
    
    required init?(coder aDecoder: NSCoder) {
        lists = Array<Checklist>()
        super.init(coder: aDecoder)
        loadChecklist()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    // delegate - Cancel
    func listDetailViewControllerDidCancel(controller: ListDetailViewController) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    // delegate - Add
    func listDetailViewController(controller: ListDetailViewController, didFinishAddingChecklist checklist: Checklist) {
        let index = lists.count
        lists.append(checklist)
        let indexPath = NSIndexPath(forItem: index, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
        dismissViewControllerAnimated(true, completion: nil)
    }

    // delegate - Edit
    func listDetailViewController(controller: ListDetailViewController, didFinishEditingChecklist checklist: Checklist) {
        print(checklist.name)
        if let index = lists.indexOf(checklist) {
            let indexPath = NSIndexPath(forItem: index, inSection: 0)
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
                cell.textLabel?.text = checklist.name
            }
        }
        dismissViewControllerAnimated(true, completion: nil)
    }

    
    //  number of rows
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return lists.count
    }

    // content of each cell
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = cellForTableView(tableView)
        let checklist = lists[indexPath.row]
        cell.textLabel!.text = checklist.name
        cell.accessoryType = .DetailDisclosureButton
        return cell
    }

    // actions when touch a row
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let checklist = lists[indexPath.row]
        performSegueWithIdentifier("ShowChecklist", sender: checklist)
    }
    
    // delete a row
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        lists.removeAtIndex(indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
    }
    
    // pass the edit data
    override func tableView(tableView: UITableView, accessoryButtonTappedForRowWithIndexPath indexPath: NSIndexPath) {
        let navigationController = storyboard!.instantiateViewControllerWithIdentifier("ListDetailNavigationController") as! UINavigationController
        let controller = navigationController.topViewController as! ListDetailViewController
        controller.delegate = self
        let checklist = lists[indexPath.row]
        controller.checklistToEdit = checklist
        presentViewController(navigationController, animated: true, completion: nil)
        
    }
    
    // prepare for showing checklist or adding checklist
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowChecklist" {
            let controller = segue.destinationViewController as! ChecklistViewController
            // we pass the reference of checklists
            controller.checklist = sender as! Checklist
        } else if segue.identifier == "AddChecklist" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let controller = navigationController.topViewController as! ListDetailViewController
            controller.delegate = self
            controller.checklistToEdit = nil
        }
    }
    
    // content of each row
    func cellForTableView(tableView: UITableView) -> UITableViewCell {
        let cellIdentifier = "Cell"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier) {
            return cell
        } else {
            return UITableViewCell(style: .Default, reuseIdentifier: cellIdentifier)
        }
    }
    
    // get the document directory
        func documentsDirectory() -> String {
            let paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)
            return paths[0]
        }
    
    // get the file path
        func dataFilePath() -> String {
            return (documentsDirectory() as NSString).stringByAppendingPathComponent("Checklists.plist")
            // or return "\(documentsDirectory())/Checklists.plist"
        }
    
    // save check list items
        func saveChecklist() {
            let data = NSMutableData()
            let archiver = NSKeyedArchiver(forWritingWithMutableData: data)
            archiver.encodeObject(lists, forKey: "Checklist")
            archiver.finishEncoding()
            data.writeToFile(dataFilePath(), atomically: true)
        }
    
    // load data from .plist file
        func loadChecklist() {
            let path = dataFilePath()
            if NSFileManager.defaultManager().fileExistsAtPath(path) {
                if let data = NSData(contentsOfFile: path) {
                    let unarchiver = NSKeyedUnarchiver(forReadingWithData: data)
                    lists = unarchiver.decodeObjectForKey("Checklist") as! [Checklist]
                    unarchiver.finishDecoding()
                }
            }
        }
    
    
}

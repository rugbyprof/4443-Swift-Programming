//
//  AddItemViewController.swift
//  Checklist_Swift1
//
//  Created by Terry Griffin on 2/23/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {

    @IBAction func cancel() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        return nil
    }
}

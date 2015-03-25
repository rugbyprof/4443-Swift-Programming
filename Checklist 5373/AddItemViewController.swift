//
//  AddItemViewController.swift
//  Checklist 5373
//
//  Created by Terry Griffin on 2/26/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class AddItemViewController: UITableViewController {
    @IBAction func cancel() {
        println("running")
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func done() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
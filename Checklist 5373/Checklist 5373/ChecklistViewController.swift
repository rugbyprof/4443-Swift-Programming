//
//  ViewController.swift
//  Checklist 5373
//
//  Created by Terry Griffin on 2/26/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {

    var items: ChecklistItems

    required init(coder aDecoder: NSCoder) {

        items = ChecklistItems()

        items.addItem("Walk the Dog",checked: true)
        items.addItem("Take out the Trash",checked: false)

        super.init(coder: aDecoder)

    }
    
    @IBAction func addItem() {
        let newRowIndex = items.listCount()
        
        var item = ChecklistItem()
        
        item.text = "I am a new row"
        item.checked = true
        
        items.addItem(item)
        
        let indexPath = NSIndexPath(forRow: newRowIndex, inSection: 0)
        let indexPaths = [indexPath]
        tableView.insertRowsAtIndexPaths(indexPaths, withRowAnimation: .Automatic)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tableView.rowHeight = 44
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.listCount()
    }
    
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        
        let item = items.getItem(indexPath.row)
        
        configureCheckmarkForCell(cell, withChecklistItem: item)
        configureTextForCell(cell, withChecklistItem: item)
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .None {
                cell.accessoryType = .Checkmark
            } else {
                cell.accessoryType = .None
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }

    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
            // 1
            items.removeItem(indexPath.row)
            // 2
            let indexPaths = [indexPath]
            tableView.deleteRowsAtIndexPaths(indexPaths,withRowAnimation: .Automatic)
    }
    
    func configureCheckmarkForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
            
        if item.checked {
            cell.accessoryType = .Checkmark
        }else{
            cell.accessoryType = .None
        }
            
    }
    
    func configureTextForCell(cell: UITableViewCell, withChecklistItem item: ChecklistItem) {
        let label = cell.viewWithTag(1000) as UILabel
        label.text = item.text
    }

}

 
//
//  ViewController.swift
//  Checklists
//
//  Created by Terry Griffin on 2/26/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit

class ChecklistViewController: UITableViewController {
    
    var items:[ChecklistItem]
    
    required init(coder aDecoder: NSCoder){
        items = [ChecklistItem]()
        
        var temp = ChecklistItem()
        
        temp.text = "Learn Swift"
        temp.checked = true
        items.append(temp)
        
        temp.text = "Graduate"
        temp.checked = true
        items.append(temp)
        
        temp.text = "Pass Orals"
        temp.checked = true
        items.append(temp)
    
        temp.text = "Eat Icecream"
        temp.checked = true
        items.append(temp)
        
        temp.text = "Burn calories"
        temp.checked = true
        items.append(temp)
        
        println(items.count)
        
        super.init(coder: aDecoder)
    }
    
    @IBAction func addItem(){
        let newRowIndex = items.count
        
        var item = ChecklistItem()
        
        item.text = "New row!!"
        item.checked = false
        
        items.append(item)
        
        let indexPath = NSIndexPath( forRow: newRowIndex, inSection: 0)
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
        return items.count
    }
    
    override func tableView(tableView: UITableView,cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ChecklistItem") as UITableViewCell
        
        let label = cell.viewWithTag(1000) as UILabel
        label.text = items[indexPath.row].text
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
            if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            
                items[indexPath.row].checked = !items[indexPath.row].checked
            
                if cell.accessoryType == .None {
                } else {
                    cell.accessoryType = .None
                }
            }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}


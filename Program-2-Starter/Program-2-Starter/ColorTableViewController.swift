//
//  ColorTableViewController.swift
//  Program-2-Starter
//
//  Created by Terry Griffin on 3/23/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

protocol ColorTableViewControllerDelegate: class {
    func ColorTableViewChooseColorCancel(controller:ColorTableViewController)
    func ColorTableViewChooseColor(controller: ColorTableViewController, chosenColor color: String)
}


class ColorTableViewController: UITableViewController {
    
    var myColors:Colors = Colors()
    var currentColor:String = ""
    var prevColor:String = ""
    
    weak var delegate: ColorTableViewControllerDelegate?
    
    @IBOutlet weak var doneMenuButton: UIBarButtonItem!
    @IBOutlet weak var cancelMenuButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myColors.resetCurrent()
        doneMenuButton.enabled = false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Methods
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        println("Again:")
        println(myColors.fetchColorCount())
        return myColors.fetchColorCount()
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let CellId:String = "Cell"
        var cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier(CellId) as UITableViewCell
        
        var color = myColors.fetchNextColor()
        
        let name = color.colorName
        
        println(name)
        
        cell.textLabel?.text = name
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = self.tableView.cellForRowAtIndexPath(indexPath)
        let text = cell?.textLabel?.text
        if let text = text {
            println("did select and the text is \(text)")
            currentColor = text
            if(currentColor == prevColor){
                delegate?.ColorTableViewChooseColor(self,chosenColor:currentColor)
            }
            prevColor = text
            doneMenuButton.enabled = true
        }
        println(currentColor)
    }
    
    // MARK: - Button Action Methods
    
    
    @IBAction func doneMenuButton(sender: AnyObject) {
        println("pushed done and color is: \(currentColor)")
        delegate?.ColorTableViewChooseColor(self,chosenColor:currentColor)
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func cancelMenuButton(sender: AnyObject) {
        println("cancelled")
        delegate?.ColorTableViewChooseColorCancel(self)
        //dismissViewControllerAnimated(true, completion: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
    
}

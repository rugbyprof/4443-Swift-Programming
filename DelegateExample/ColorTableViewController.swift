//
//  colorTableViewController.swift
//  DelegateExample
//
//  Created by Terry Griffin on 3/9/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit

class ColorTableViewController : UITableViewController {
    

    var myColors:Colors
    
    @IBOutlet var colorsTableView: UITableView!
    
    required init(coder aDecoder: NSCoder){
        
        myColors = Colors()
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Fetch the Json color object from the CS server
        request(.GET, "http://cs.mwsu.edu/~griffin/swift/colors2.json")
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    println("Error: \(error)")
                    println(req)
                    println(res)
                } else {
                    
                    println("Success")
                    
                    //Unwrap the json (not safe, but oh well)
                    var json = JSON(json!)
                    
                    //If we are successful, then call the method `parseJson` to load the "color class: Colors"
                    self.parseJson(json)
                    
                }
        }

    }
    
    class CustomTableViewCell : UITableViewCell {
        
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myColors.fetchColorCount()
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        println(myColors.fetchColorCount())
 
        let cell = self.tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        // Get the corresponding candy from our candies array
        if let color = myColors.fetchNextColor()? {
        
            // Configure the cell
            cell.textLabel!.text = color.colorName
            cell.backgroundColor = myColors.hexStringToUIColor(color.hexValue)
            cell.accessoryType = UITableViewCellAccessoryType.DisclosureIndicator
        }
        
        return cell
    }
    
    /********************************************************************************************
    * Function: parseJson
    *   Parses json object and loads it into the "Colors" class for us to use.
    * @Params:
    *   json:JSON - Json object to be parsed
    * @Returns:
    *   Void
    ********************************************************************************************/
    func parseJson(json:JSON)->Void{
        
        var colors = Colors()
        var colorName = ""
        var hexValue = ""
        var hsv:HSV
        var hsl:HSL
        var rgb:RGB
        var col = ""
        var hex = ""
        var r = 0.0
        var g = 0.0
        var b = 0.0
        var h1 = 0
        var s1 = 0.0
        var h2 = 0
        var s2 = 0.0
        var l = 0.0
        var v = 0.0
        
        
        for (index,subjson) in json {
            for (key,val) in subjson {
                switch key {
                case "colorName":
                    col = val.stringValue
                case "hexValue":
                    hex = val.stringValue
                case "RGB":
                    r = val["R"].doubleValue
                    g = val["G"].doubleValue
                    b = val["B"].doubleValue
                case "HSL":
                    h1 = val["H"].intValue
                    s1 = val["S"].doubleValue
                    l = val["L"].doubleValue
                case "HSV":
                    h2 = val["H"].intValue
                    s2 = val["S"].doubleValue
                    v = val["V"].doubleValue
                default:
                    println("Error!")
                }
            }
            
            self.myColors.addColor(col,hex:hex,red:r,green:g,blue:b,hue1:h1,sat1:s1,hue2:h2,sat2:s2,value:v,lightness:l)
        }
        self.tableView.reloadData()
    }


}

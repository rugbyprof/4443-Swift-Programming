//
//  AddItemViewController.swift
//  Delegate1
//
//  Created by Terry Griffin on 3/4/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class GetColorViewController: UITableViewController {
    
    var myColors : Colors
    
    required init(coder aDecoder: NSCoder)
    {
        myColors = Colors()
        
        //Fetch the Json color object from the CS server
        .request(.GET, "http://cs.mwsu.edu/~griffin/swift/colors2.json")
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
                    
                    //Start the game
                    self.matchColorLogic()
                    
                    
                    //Example usage of the Colors class
                    var randColor = self.myColors.fetchRandomColor()
                    
                    println("\(randColor.hexValue) : \(randColor.colorName) ")
                    
                    var uicolor = self.myColors.hexStringToUIColor(randColor.hexValue)
                    
                    println(uicolor)
                }
        }
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}
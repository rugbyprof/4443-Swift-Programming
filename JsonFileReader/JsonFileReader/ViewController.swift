//
//  ViewController.swift
//  JsonFileReader
//
//  Created by Terry Griffin on 2/3/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let url = "https://raw.githubusercontent.com/rugbyprof/msu-swift/master/Swift%20Color%20Game%20for%20Kids/Swift%20Color%20Game%20for%20Kids/colors.json?token=AA_qiMX6aezCbZRcASGFVWX5IFfGJ2pwks5U2nY9wA%3D%3D"
        
        request(.GET, url)
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    println("Error: \(error)")
                    println(req)
                    println(res)
                }
                else {
                    println("Success: \(url)")
                    var json = JSON(json!)
                    for (key: String, subJson: JSON) in json {
                        println(key)
                    }
                }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


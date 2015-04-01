//
//  secondViewController.swift
//  Pass_Data_Forward
//
//  Created by Terry Griffin on 3/31/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    
    @IBOutlet weak var receivedDataLabel: UILabel!
    
    var receivedData = "empty"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        receivedDataLabel.text = receivedData
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//
//  ViewController.swift
//  Pass_Data_Forward
//
//  Created by Terry Griffin on 3/31/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var passDataButton: UIButton!
    
    @IBOutlet weak var passDataText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "passData"){
            var svc = segue.destinationViewController as SecondViewController
            svc.receivedData = passDataText.text
        }
    }
    
}


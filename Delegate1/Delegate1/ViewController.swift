//
//  ViewController.swift
//  Delegate1
//
//  Created by Terry Griffin on 3/4/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textBoxMain: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func textBoxMainTouchDown(sender: AnyObject) {
        textBoxMain.text = "Hello World"
    }


}


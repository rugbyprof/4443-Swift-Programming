//
//  ViewController.swift
//  DelegateExample
//
//  Created by Terry Griffin on 3/10/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit

class ViewController: UIViewController , DataEnteredDelegate{

    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func userDidEnterInformation(info: String) {
        dataLabel.text = info
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC"{
            let secondVC:SecondViewController = segue.destinationViewController as SecondViewController
            secondVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


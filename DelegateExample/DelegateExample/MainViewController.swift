//
//  ViewController.swift
//  DelegateExample
//
//  Created by Terry Griffin on 3/11/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController ,  helpSendDataDelegate{

    @IBOutlet weak var hopeThisWorks: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func didSendData(controller:SecondViewController,text:String){
        
        hopeThisWorks.text = text
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "mySegue"{
            let secondVC:SecondViewController = segue.destinationViewController as SecondViewController
            secondVC.delegate = self
        }
        println("hello world")
        
    }
    

}


//
//  ViewController.swift
//  BullsEye
//
//  Created by M.I. Hollemans on 10/09/14.
//  Copyright (c) 2014 Razeware. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func showAlert() {
    let alert = UIAlertController(title: "Hello, World",
      message: "This is my first app!",
      preferredStyle: .Alert)
    
    let action = UIAlertAction(title: "Awesome", style: .Default,
      handler: nil)
    
    alert.addAction(action)
    
    presentViewController(alert, animated: true, completion: nil)
  }
}

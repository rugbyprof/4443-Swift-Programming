//
//  FirstViewController.swift
//  Kitchen Sink
//
//  Created by Terry Griffin on 4/20/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit


class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let motionKit = MotionKit()
        
        motionKit.getGyroValues(interval: 1.0){
            (x, y, z) in
            //Do whatever you want with the x, y and z values
            println("X: \(x) Y: \(y) Z \(z)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


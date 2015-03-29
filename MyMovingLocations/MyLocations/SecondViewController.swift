//
//  SecondViewController.swift
//  MyLocations
//
//  Created by Terry Griffin on 3/24/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit
import MapKit

class SecondViewController: UIViewController,MKMapViewDelegate {

    @IBOutlet weak var mapView: MKMapView!
    
    var currentPoint = PointData()
    
    var annotation = MKPointAnnotation()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        var showLocation = NSTimer.scheduledTimerWithTimeInterval(2.0, target: self, selector: "updateMap", userInfo: nil, repeats: true)
    }
    
    func updateMap(){
        currentPoint = (self.tabBarController as CustomTabBarController).currentPoint
        
        
        
        let currentLocation = CLLocationCoordinate2D(
            latitude: currentPoint.lat,
            longitude: currentPoint.lon
        )
        
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: currentLocation, span: span)
        mapView.setRegion(region, animated: true)
        
        
        
        annotation.setCoordinate(currentLocation)
        //annotation.title = "Big Ben"
        //annotation.subtitle = "London"
        mapView.removeAnnotation(annotation)
        mapView.addAnnotation(annotation)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}

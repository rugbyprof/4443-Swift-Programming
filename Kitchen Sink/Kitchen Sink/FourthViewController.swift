//
//  FourthViewController.swift
//  Kitchen Sink
//
//  Created by Terry Griffin on 4/20/15.
//  Copyright (c) 2015 mwsu. All rights reserved.
//

import UIKit


class FourthViewController: UIViewController {
    
    var screenSize:CGRect
    var screenWidth:CGFloat
    var screenHeight:CGFloat
    var boxWidth:CGFloat
    var boxHeight: CGFloat
    
    var labelContainer:[UILabel]
    
    var currentX:CGFloat
    var currentY:CGFloat
    
    let tapRec = UITapGestureRecognizer()
    

    @IBOutlet weak var buttonAdd: UIBarButtonItem!
    @IBOutlet weak var buttonUndo: UIBarButtonItem!
    
    required init(coder aDecoder: NSCoder) {

        self.screenSize = UIScreen.mainScreen().bounds
        self.screenWidth = screenSize.width
        self.screenHeight = screenSize.height
        self.boxWidth = self.screenWidth / 5
        self.boxHeight = self.boxWidth
        
        labelContainer = [UILabel]()
        
        println("\(screenWidth) , \(screenHeight)")
        
        currentX = boxWidth / 2.0
        currentY = boxWidth / 2.0 + 65.0
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tapRec.addTarget(self, action: "tappedView")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getRandomColor() -> UIColor{
        let red = CGFloat(arc4random_uniform(255)) / 255.0
        let green = CGFloat(arc4random_uniform(255)) / 255.0
        let blue = CGFloat(arc4random_uniform(255)) / 255.0
        
        println("\(red) \(green) \(blue)")
        
        let color:UIColor = UIColor(red: red, green: green, blue:blue, alpha: 1)
        
        return color
    }
    

    @IBAction func addColor(sender: AnyObject) {
        var label = UILabel(frame: CGRectMake(0, 0, 50, 50))
        //label.center = CGPointMake(screenSize.width/2.0, screenSize.height/2.0)
        label.center = CGPointMake(currentX, currentY)
        label.textAlignment = NSTextAlignment.Center
        label.backgroundColor = getRandomColor()
        label.layer.shadowOffset = CGSize(width: 3, height: 3)
        label.layer.shadowOpacity = 0.7
        label.layer.shadowRadius = 2
        self.view.addSubview(label)
        labelContainer.append(label)
        self.currentX += boxWidth
        if labelContainer.count > 0 && labelContainer.count % 5 == 0 {
            self.currentY += boxWidth
            self.currentX = boxWidth / 2.0
        }
    }
    
    @IBAction func undoColor(sender: AnyObject) {
        
//        for view in self.view.subviews {
//            view.removeFromSuperview()
//        }
        
//        view.subviews.map({ $0.removeFromSuperview() })
        
        let lastView = self.view.subviews.last
        lastView?.removeFromSuperview()
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if motion == .MotionShake {
            println("did shake")
            reorderColors()
        }
    }
    
    func reorderColors(){
        
        println("in reorder")
        
        var newOrder = [UILabel]()
        
        while self.labelContainer.count > 0 {
            newOrder.append(self.labelContainer.removeAtIndex(Int(arc4random_uniform(UInt32(self.labelContainer.count)))))
        }
        
        self.labelContainer.removeAll(keepCapacity: false)
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        
        for label in newOrder{
            self.view.addSubview(label)
            self.labelContainer.append(label)
            println("sleeping")
        }
    }
    
}

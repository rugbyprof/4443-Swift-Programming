// Playground - noun: a place where people can play

import UIKit
import Darwin


var str = "Hello, playground"




func ColorDistance(e1: UIColor,e2: UIColor) -> Double{
    var r1:CGFloat = 0,g1:CGFloat = 0,b1:CGFloat = 0, a1:CGFloat = 0
    var r2:CGFloat = 0,g2:CGFloat = 0,b2:CGFloat = 0, a2:CGFloat = 0
    e1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
    e2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
    
    let rmean = ( r1 + r2 ) / 2;
    let r = r1 - r2
    let g = g1 - g2
    let b = b1 - b2
    
    var tempR = Int((512+rmean)*r*r) >> 8
    var tempG = Int(4*g*g)
    var tempB = Int((767-rmean)*b*b) >> 8
    
    return (tempR + tempG + tempB)
    
}

func UIColorFromRGB(rgbValue: UInt) -> UIColor {
    return UIColor(
        red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
        green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
        blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
        alpha: CGFloat(1.0)
    )
}

let one = UIColorFromRGB(0xFF1493)
let two = UIColorFromRGB(0xFF69B4)
let distance = ColorDistance(one,two)

//A very simple approach is to calculate the summarized distance among the three dimensions. For example simple_distance("12,10,255","10,10,250")=7
//
//A more sophisticated approach would be to take the square of the distances for each components and sum those - this way components being too far would be "punished" more: square_distance("12,10,255","10,10,250")=2*2+0*0+5*5=29.
//
//Of course you would have to iterate over the list of colors and find the closest one

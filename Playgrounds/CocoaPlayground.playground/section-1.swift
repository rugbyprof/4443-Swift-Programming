// Playground - noun: a place where people can play

import Cocoa
import XCPlayground

var frameRect = NSRect(x: 0,  y:0,width:300,height:300)

var view = NSImageView(frame: frameRect)

var griffinPicUrl = NSURL(string: "http://cs.mwsu.edu/~griffin/images/ugly2.png")

var griffinPic = NSImage(contentsOfURL: griffinPicUrl!)

view.image = griffinPic

XCPShowView("Me",view)




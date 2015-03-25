// Playground - noun: a place where people can play

import UIKit


//Example standard functions
func square(a:Float) -> Float {
    return a * a
}

func cube(a:Float) -> Float {
    return a * a * a
}

func notfloor(a:Float) -> Int {
    return Int(a)
}

func lunges(tights:Int) -> Int{
    return tights
}

func averageSumOfSquares(a:Float,b:Float) -> Float {
    return (square(a) + square(b)) / 2.0
}

func averageSumOfCubes(a:Float,b:Float) -> Float {
    return (cube(a) + cube(b)) / 2.0
}

//Standard function call
var c = averageSumOfCubes(3.2, 4.3)


//Closure to consolidate above function defs
func averageOfFunction(a:Float,b:Float,f:(Float -> Float)) -> Float {
    return (f(a) + f(b)) / 2
}



//Calling the function w/ closure
//averageOfFunction(3, 4, square)
//averageOfFunction(3, 4, cube)
//averageOfFunction(3, 4, floor)


/*****************************************/
//My answer

func NthIt(a:Int,n:Int) -> Int{
    var ans : Int = a
    for x in 1..<n {
        ans = ans * a
    }
    return ans
}

NthIt(4,4)


func averageSumOfNs(a : [Int],n : Int) -> Int {
    var ans :Int = 0
    for x in 0..<a.count {
        ans = ans + NthIt(a[x],n)
    }
    return ans
}

var Nums :[Int] = [3,4,5,2,2,6,7,4,8]


averageSumOfNs(Nums,2)

averageOfFunction(3, 4, {(x: Float) -> Float in return x * x})







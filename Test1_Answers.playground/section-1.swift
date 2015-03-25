 // Playground - noun: a place where people can play

import Foundation


let someinttts = [String]()

 
 
//1.
// var = a variable
// let = a constant 
// var is a mutable data type
// let is an immutable data type (mostly)

/***********************************************************************************************************/

//2.
//Explicit means assigning a data type to a var or let without question
//Implicit means assigning a data type to a var by letting the first value assigned make the determination.
//Either way variables or constants must get a data type.
//Examples:

let I = 4      //Implicit - the 4 makes the determination
var E:Double   // Explicit - the keyword "Double" is stating that "b" IS a Double

/***********************************************************************************************************/
//3.
var a = 0
let b = ++a
let c = a++

a           //2
b           //1
c           //1

/***********************************************************************************************************/
//4.
//- Tuple: A tuple is simply an ordered list of values, where the type of each value is fixed, but each entry may
//         contain different types (including other tuples). This is also called a "compound type".
//         Swift Def: A tuple type is a comma-separated list of zero or more types, enclosed in parentheses.
//- Dictionary: An unordered list of "key":"value" pairs 
//         There is some trickery with optionals, but we will hit that next test.

var myDictionary = ["Bobs":"Dog", "Billys":"Cat", "Suzies":"Cow", "Beths":"Snake"]
 

 

var myTuple = (Bobs:"Dog", Billys:"Cat", Suzies:"Cow", Beths:"Snake")

//struct D{
//    var key:String
//    var val:String
//}
//
//var myTuple2 = ((key:"Bobs",val:"Dog"), (key:"Billys",val:"Cat"), (key:"Suzies",val:"Cow"), (key:"Beths",val:"Snake"))
//
//println(myTuple2.0.val)


/***********************************************************************************************************/
//5

var surveyAnswer: String?
println(surveyAnswer)

/***********************************************************************************************************/
//6

let l = 10
var p = 5
p = l

p

/***********************************************************************************************************/
//7 

var tpl = (23, "Padre", 0.08, "Hair of the Dog", 42, 3.14159)
var(two, island, legal_limit, hangOver, everyThing, Pi) = tpl

/***********************************************************************************************************/
//8



let contentHeight1 = 40
let hasHeader1 = true
let rowHeight1 = contentHeight1 + (hasHeader1 ? 50 : 20)



let contentHeight2 = 40
let hasHeader2 = true

if(hasHeader2 == true){
    let rowHeight2 = contentHeight2 + 50;
}else{
    let rowHeight2 = contentHeight2 + 20;
}


/***********************************************************************************************************/
//9

var myOtherDictionary = ["Bobs":"Dog", "Billys":"Cat", "Suzies":"Cow", "Beths":"Snake"]

for(key,val) in myOtherDictionary{
    println("\(key):\(val)")
}


/***********************************************************************************************************/
//10

// It is perfectly good syntax as long as the datatypes of each of the condition variables is Bool.
// Integers will not work in this situation (or it's not supposed to)
// And NO parenthesis are not needed

let enteredDoorCode = true
let passedRetinaScan = true
let hasDoorKey = false
let knowsOverridePassword = true

if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    println("Welcome!")
} else {
    println("ACCESS DENIED")
}

/***********************************************************************************************************/
//11
// Problems! Just like above, parenthesis or not, the condition variables need to be of type Bool
// AND, this isn't C or C++ syntax so the 'int' types before the condition vars is incorrect.

var aa = false
var bb = true
var cc = true
var dd = false

if ( aa || bb && cc || dd ){
    println("hello")
}else{
    println("goodbye")
}


/***********************************************************************************************************/
//12

func MinMax(A:[Int])->(min:Int,max:Int){
    
    var Min = A[0]
    var Max = A[0]
    
    for i in A[1..<A.count]{
        if i < Min{
            Min = i
        }
        
        if i > Max{
            Max = i
        }
    }

    return (Min,Max)
}
 
 func MinMax2(A:[Int])->[String:Int]{
    
    var Min = A[0]
    var Max = A[0]
    
    for i in A[1..<A.count]{
        if i < Min{
            Min = i
        }
        
        if i > Max{
            Max = i
        }
    }
    
    return ["Min":Min,"Max":Max]
 }

func PrintArray(A:[Int]){
    
    for j in A[1..<A.count]{
        j
    }
}

var MyArray:[Int] = [3,5,4,7,8,6,1,2,9]

let (min,max) = MinMax(MyArray)


println("The minimum is: \(min) and the maximum is: \(max)")

PrintArray(MyArray)

/***********************************************************************************************************/
//13
//Not every reference to memory needs the ability to change aka constants. Swift can optimize it's code more 
//freely with a liberal use of constants as opposed to everthing being a variable.

let Presidents = ["Washington","Adams","Madison","Monroe","Adams","Jackson","Van Buren","Bush","Clinton","Bush","Obama"]
let Months = ["January","February","December"]


/***********************************************************************************************************/
//14

var someInts1:[Int] = []
var someInts2:[Int]
var someInts3 = [Int]()

/***********************************************************************************************************/
//15

var address = (Number:3410, Line_1:"Taft Blvd", Line_2:"Computer Science",City:"Wichita Falls",State:"Tx", Zipcode:78245)

println(address.City)
println(address.3)



/***********************************************************************************************************/
//16

var peoples = ["Bobs": "Dog", "Billys": "Cat", "Suzies": "Cow", "Beths": "Snake"]

peoples["Billys"] = nil
peoples.removeValueForKey("Suzies")

 
peoples


/***********************************************************************************************************/
//17
// There are a couple of issues that need addressed. 
// 1. The syntax as placed on the test is ... well wrong. But remember the instructions? Don't let syntax ruin
//    the spirit of the quesion.

enum CompassPoint {
    case North
    case South
    case East
    case West
}

var directionToHead = CompassPoint.West //Need this to establish a data type (CompassPoint)

directionToHead = .South                //Now we can do this

switch directionToHead {                //And this is good! Why?
case .North:
    println("Lots of planets have a north")
case .South:
    println("Watch out for penguins")
case .East:
    println("Where the sun rises")
case .West:
    println("Where the skies are blue")
}


/***********************************************************************************************************/
//18
let pi = 3.14159
let radius = 4

//var area = radius * radius * pi
var area = Double(radius) * Double(radius) * pi

/***********************************************************************************************************/
//19
var anotherArray:[Int] = [3,5,4,7,8,6,1,2,9]

for i in 0..<anotherArray.count{
    i
}

//or 

for k in 0..<anotherArray.count{
    anotherArray[k]
}

//or

for j in anotherArray[0..<anotherArray.count]{
    j
}


 for val in anotherArray{
    println(val)
 }
 
 
 
/***********************************************************************************************************/
//20

struct Resolution {
    var width = 0
    var height = 0
}

class VideoMode {
    var resolution = Resolution()
    var interlaced = false
    var frameRate = 0.0
    var name: String?
}

let hd = Resolution(width: 1920, height: 1080)

let someResolution = Resolution()

let someVideoMode = VideoMode()

let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interlaced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0

let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
tenEighty


//The reason for the difference is as the question implies: classes and structs are handled differently.
//Classes are reference type
//Structs are value types

//Reference types are passed by address so copies of them that are changed cascade back to the original (cascade is probably not the word to use.
//Value types are complete new copies, so any changes to the copy stay in the copy

//And you thought pointers were stupid and limited to C++ ... HAH!

 
 struct mm{
    var x:Int
    var y:Int
 }
 
 let mmm = mm(x:3,y:8)
 
 
 
 
 
 
 
 
 
 


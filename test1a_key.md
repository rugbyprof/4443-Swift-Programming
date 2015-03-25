***Question 1***

`var = variable`<br>
`let = constant`

Difference is `let` creates an immutable instance of a value, but can be more efficient for your program to use.

***Question 2***

Explicit = giving a `var` or a `let` a datatype explicitly.
Implicit = giving a `var` or a `let` a datatype through implication or implied by the value assigned to it.

```swift
var a:Double = 0.0
let b = 3.4
```
Both assignments cause their targets to be Doubles.

***Question 3***

```swift
a=2
b=1
c=1
```
***Question 4***

```swift
var tupl = (1:"one",2:"two",3:"three",4:"four")
var dict = ["1":"one","2":"two","3":"three","4":"four"]
```
***Question 5***

nil

***Question 6***

10

***Question 7***

```swift
var (a,b,c,d,e,f) = tpl
```

***Question 8***

```swift
let contHeight = 40
let hasHeader = true
if(hasheader == true){
	let rowHeight = contentHeight + 50;
}else{
	let rowHeight = contentHeight + 20;
}
```

***Question 9***

```swift
for (key,val) in dictionary {
    println("\(key):\(val)")
}
```

***Question 10***

Yes. 

Swift doesn't care about parenthesis where "boolean tests" need to go. As long as the variables are of type `Bool` and the operators match up. It does require code blocks however, and they are present.

***Question 11***

Problems are that a,b,c,d are all of type `Int` and they need to be of type `Bool`.

***Question 12***

```swift
func MinMax(A:[Int])->(Int,Int){
    
    var Min:Int = A[0]
    var Max:Int = A[0]
    
    for i in 0..<A.count{
        if Min < A[i]{
            Min = A[i]
        }
        if Max > A[i]{
            Max = A[i]
        }
    }
    
    return (Min,Max)
}
```

***Question 13***

Immutable = more efficient application

```swift
let Collection = [3,4,5,6,7]
```

***Question 14***

```swift
var someInts :[Int]
```

***Question 15***

```swift
println(address["City"])
println(address.3)
```

***Question 16***

```swift
dictionary["Billys"] = nil
```

***Question 17***

Yes. Because CompassPoint is an enumerated type and the switch has a case for every possible value in the type. Therefore it covers all possibilities and a "default" case is not necessary.

***Question 18***

var area = (Double)radius * (Double)radius * pi

***Question 19***
```swift
for i in 0..<MyArray.count {
    println(MyArray[i])
}
```
***Question 20***

```swift
tenEighty: {}
alsoTenEighty: {}
```

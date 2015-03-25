***Question 1***

var area = (Double)radius * (Double)radius * pi


***Question 2***

```swift
for i in 0..<MyArray.count {
    println(MyArray[i])
}
```

***Question 3***

```swift
for (key,val) in dictionary {
    println("\(key):\(val)")
}
```
***Question4***

Yes. Because CompassPoint is an enumerated type and the switch has a case for every possible value in the type. Therefore it covers all possibilities and a "default" case is not necessary.

***Question 5***

Yes. 

Swift doesn't care about parenthesis where "boolean tests" need to go. As long as the variables are of type `Bool` and the operators match up. It does require code blocks however, and they are present.

***Question 6***

Problems are that a,b,c,d are all of type `Int` and they need to be of type `Bool`.

***Question 7***

`var = variable`<br>
`let = constant`

Difference is `let` creates an immutable instance of a value, but can be more efficient for your program to use.

***Question 8***

Explicit = giving a `var` or a `let` a datatype explicitly.
Implicit = giving a `var` or a `let` a datatype through implication or implied by the value assigned to it.

```swift
var a:Double = 0.0
let b = 3.4
```
Both assignments cause their targets to be Doubles.

***Question 9***

```swift
a=2
b=1
c=1
```
***Question 10***

```swift
var tupl = (1:"one",2:"two",3:"three",4:"four")
var dict = ["1":"one","2":"two","3":"three","4":"four"]
```
***Question 11***

nil


***Question 12***

10

***Question 13***

```swift
var (a,b,c,d,e,f) = tpl
```


***Question 14***

```swift
let contHeight = 40
let hasHeader = true
if(hasheader == true){
	let rowHeight = contentHeight + 50;
}else{
	let rowHeight = contentHeight + 20;
}
```

***Question 15***

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

***Question 16***

Immutable = more efficient application

```swift
let Collection = [3,4,5,6,7]
```

***Question 17***

```swift
var someInts :[Int]
```

***Question 18***

```swift
println(address["City"])
println(address.3)
```

***Question 19***

```swift
dictionary["Billys"] = nil
```


***Question 20***

```swift
tenEighty: {}
alsoTenEighty: {}
```

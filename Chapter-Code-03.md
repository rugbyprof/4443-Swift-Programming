## Classes and Structs

#### Create file: Treasure.swift

```swift
class Treasure {
  let what: String
  let latitude: Double
  let longitude: Double
}
```
####  Add to above class

```swift
init(what: String, latitude: Double, longitude: Double) {
  self.what = what
  self.latitude = latitude
  self.longitude = longitude
}
```
#### Create file: GeoLocation

```swift
struct GeoLocation {
  var latitude: Double
  var longitude: Double
}
```

### Treasure.swift

- Replace lat lon with:

```swift
let location: GeoLocation
```
## Reference types vs. value types

#### Playground

```swift
import UIKit

var str = "Hello, playground"

struct MyStruct{
    var foo: Double = 0.0
}

class MyClass {
    var foo: Double = 0.0
}

var structA = MyStruct()
var structB = MyStruct()
//structB.foo = 1.0
//structA.foo
//structB.foo

structA.foo = 1.0
structB.foo = 2.0
structB = structA

structB.foo
structA.foo


var classA = MyClass()
var classB = classA

//classB.foo = 1.0
//classA.foo
//classB.foo

//classA.foo = 1.0
//classB.foo = 1.0
//classB = classB
```
## Convenience initializers

#### Treasure.swift
```swift
    convenience init(what: String,latitude: Double, longitude: Double){
        let location = GeoLocation(
                latitude: latitude,
                longitude: longitude
        )
        self.init(what: what, location: location)
    }
```

## Class inheritance
#### Treasure.swift
```swift
class HistoryTreasure: Treasure {
        
        let year: Int
        
        init(what: String, year: Int,latitude: Double, longitude: Double){
            self.year = year
            let location = GeoLocation(latitude: latitude,longitude: longitude)
            super.init(what: what, location: location)
        }
}

class FactTreasure: Treasure {
        
        let fact: String
        
        init(what: String, fact: String,latitude: Double, longitude: Double){
            self.fact = fact
            let location = GeoLocation(latitude: latitude,longitude: longitude)
            super.init(what: what, location: location)
        }
}

class HQTreasure: Treasure {
            
        let company: String
        
        init(company: String, latitude: Double, longitude: Double) {
            self.company = company
            let location = GeoLocation(latitude: latitude,longitude: longitude)
            super.init(what: company + " headquarters",location: location)
        }
}
```
## Swift and MapKit

#### ViewController.swift

```swift
    override func viewDidLoad() {
        super.viewDidLoad()
    }
```

#### Add below `@IBOutlet`

```swift
        self.treasures = [
            HistoryTreasure(
                what: "Google's first office",
                year: 1999,
                latitude: 37.44451,
                longitude: -122.163369
            ),
            HistoryTreasure(
                what: "Facebook's first office",
                year: 2005,
                latitude: 37.444268,
                longitude: -122.163271
            ),
            FactTreasure(
                what: "Stanford University",
                fact: "Founded in 1885 by Leland Stanford.",
                latitude: 37.427474,
                longitude: -122.169719
            ),
            FactTreasure(
                what: "Moscone West",
                fact: "Host to WWDC since 2003.",
                latitude: 37.783083,
                longitude: -122.404025
            ),
            FactTreasure(
                what: "Computer History Museum",
                fact: "Home to a working Babbage Difference Engine.",
                latitude: 37.414371,
                longitude: -122.076817
            ),
            HQTreasure(
                company: "Apple",
                latitude: 37.331741,
                longitude: -122.030333
            ),
            HQTreasure(
                company: "Facebook",
                latitude: 37.485955,
                longitude: -122.148555
            ),
            HQTreasure(
                company: "Google",
                latitude: 37.422,
                longitude: -122.084
            ),
        ]
```

## Class extensions and computed properties

#### Treasure.swift

```swift
import MapKit
```

##### Underneath `class Treasure`

```swift
extension Treasure: MKAnnotation {
    var coordinate: CLLocationCoordinate2D {
        return self.location.coordinate
    }
    var title: String {
        return self.what
    }
}
```

At the moment, this code doesn’t compile because it’s accessing a property on the
location called coordinate that doesn’t exist. Let’s implement that now.

#### Geolocation.swift

```swift
import MapKit
```
##### Underneath `struct GeoLocation`

```swift
extension GeoLocation {
    var coordinate: CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(self.latitude, self.longitude)
    }
    var mapPoint: MKMapPoint {
        return MKMapPointForCoordinate(self.coordinate)
    }
}
```

## Inheriting from NSObject

##### Add `NSObject` after `class Treasure` like so: `class Treasure: NSObject`

## Pinning the map

##### `ViewController.swift` (end of `viewDidLoad()`)

http://makeapppie.com/2014/08/04/the-swift-swift-tutorial-why-do-we-need-delegates/

```swift
self.mapView.delegate = self
self.mapView.addAnnotations(self.treasures)
```

#### End of `ViewController.swift`

```swift
extension ViewController: MKMapViewDelegate {
    func mapView(mapView: MKMapView!,viewForAnnotation annotation: MKAnnotation!)-> MKAnnotationView!{
        // 1
        if let treasure = annotation as? Treasure {
            // 2
            var view = mapView.dequeueReusableAnnotationViewWithIdentifier("pin") as MKPinAnnotationView!
                
            if view == nil {
            // 3
                view = MKPinAnnotationView(annotation: annotation,reuseIdentifier: "pin")
                view.canShowCallout = true
                view.animatesDrop = false
                view.calloutOffset = CGPoint(x: -5, y: 5)
                view.rightCalloutAccessoryView = UIButton.buttonWithType(.DetailDisclosure) as UIView} else {
                // 4
                view.annotation = annotation
            }
            // 5
            return view
        }
        return nil
    }
}
```

## The reduce algorithm

##### End of viewDidLoad()

```swift
        let rectToDisplay = self.treasures.reduce(MKMapRectNull) {
            (mapRect: MKMapRect, treasure: Treasure) -> MKMapRect in
            let treasurePointRect = MKMapRect(origin: treasure.location.mapPoint, size: MKMapSize(width: 0, height: 0))
            return MKMapRectUnion(mapRect, treasurePointRect)
        }
        self.mapView.setVisibleMapRect(rectToDisplay, edgePadding: UIEdgeInsetsMake(74, 10, 10, 10), animated: false)
```

## Polymorphism

##### End of `Treasure.swift` / `class Treasure`

```swift
func pinColor() -> MKPinAnnotationColor {
  return MKPinAnnotationColor.Red
}
```

#### Add the override to History and HQTreasure

```swift
func pinColor() -> MKPinAnnotationColor {
  return MKPinAnnotationColor.Green
}

func pinColor() -> MKPinAnnotationColor {
  return MKPinAnnotationColor.Purple
}
```
##### At the end of `extension ViewController: MKMapViewDelegate` before the return

```swift
view.pinColor = treasure.pinColor()
```

## Dynamic dispatch and final classes

```swift

final class HistoryTresure: Treasure
final class FactTreasure: Treasure
final class HQTreasure: Treasure
```

## Adding annotations

```swift
@objc protocol Alertable {
   func alert() -> UIAlertController
}
```

##### Add to bottom of Treasure.swift

```swift
extension HistoryTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(title: "History",
                                      message: "From \(self.year):\n\(self.what)",
                                      preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}
extension FactTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(title: "Fact",
                                      message: "From \(self.what):\n\(self.fact)",
                                      preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}
extension HQTreasure: Alertable {
    func alert() -> UIAlertController {
        let alert = UIAlertController(title: "Headquarters",
                                      message: "The headquarters of \(self.company)",
                                      preferredStyle: UIAlertControllerStyle.Alert)
        return alert
    }
}
```
##### Add to `MKMapViewDelegate extension`

```swift
    func mapView(mapView: MKMapView!,annotationView view: MKAnnotationView!,calloutAccessoryControlTapped control: UIControl!){
        if let treasure = view.annotation as? Treasure {
            if let alertable = treasure as? Alertable {
                let alert = alertable.alert()
                alert.addAction(
                    UIAlertAction(
                        title: "OK",
                        style: UIAlertActionStyle.Default,
                        handler: nil
                    )
                )
                self.presentViewController(
                    alert, animated: true, completion: nil
                )
            }
        }
    }
```

## Sorting an array

##### Open GeoLocation.swift

```swift
    func distanceBetween(other: GeoLocation) -> Double {
        let locationA = CLLocation(latitude: self.latitude,longitude: self.longitude)
        let locationB = CLLocation(latitude: other.latitude,longitude: other.longitude)
        return locationA.distanceFromLocation(locationB)
    }
```

##### Open ViewController.swift add before call to `presentViewController`

```swift
    alert.addAction(UIAlertAction(title: "Find Nearest",style: UIAlertActionStyle.Default) { action in
        var sortedTreasures = self.treasures
        sortedTreasures.sort {
            let distanceA = treasure.location.distanceBetween($0.location)
            let distanceB = treasure.location.distanceBetween($1.location)
            return distanceA < distanceB
        }
        mapView.deselectAnnotation(treasure, animated: true)
        mapView.selectAnnotation(sortedTreasures[1], animated: true)
    })
```

## Equality and operator overload

##### Open `ViewController.swift` add underneath `var treasures: [Treasure] = []`

```swift
    func mapView(mapView: MKMapView!, rendererForOverlay overlay: MKOverlay!) -> MKOverlayRenderer!{
        if let polylineOverlay = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: polylineOverlay)
            renderer.strokeColor = UIColor.blueColor()
            return renderer
        }
        return nil
    }
```

##### Find `mapView:annotationView:calloutAccessoryControlTapped` add this between the two actions already present

```swift
    alert.addAction(UIAlertAction(
        title: "Found",
        style: UIAlertActionStyle.Default) { action in
        self.markTreasureAsFound(treasure)
    })
```

##### Add this function to the main body of the `viewControllers` class:

```swift
    func markTreasureAsFound(treasure: Treasure) {
        if let index = find(self.foundLocations, treasure.location) {
            let alert = UIAlertController(
            title: "Oops!",
            message: "You've already found this treasure (at step \(index + 1))! Try again!",
                preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK",
                style: .Default,
                handler: nil)
            )
            self.presentViewController(alert,
                animated: true,
                completion: nil)
        } else {
            self.foundLocations.append(treasure.location)
            if self.polyline != nil {
                self.mapView.removeOverlay(self.polyline)
            }
            var coordinates = self.foundLocations.map { $0.coordinate }
            self.polyline = MKPolyline(coordinates: &coordinates,
            count: coordinates.count)
            self.mapView.addOverlay(self.polyline)
        }
    }
```

##### Should be an error dealing with `find()` because we need to overload the `==`

##### At the bottom of `GeoLocation.swift`

```swift
extension GeoLocation: Equatable {
}

func ==(lhs: GeoLocation, rhs: GeoLocation) -> Bool {
    return lhs.latitude == rhs.latitude &&
    lhs.longitude == rhs.longitude
}
```
## Access Control

Next time....

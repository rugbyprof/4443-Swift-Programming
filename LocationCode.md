Add:

labels and button

--

```swift
import CoreLocation
```

Add: `CLLocationManagerDelegate` to `CurrentLocationViewController`

```swift
class CurrentLocationViewController: UIViewController, CLLocationManagerDelegate {

}
```

Add: `let locationManager = CLLocationManager()` to `CurrentLocationViewController`



```swift
@IBAction func getLocation() {
```

Add to bottom of file:

```swift
// MARK: - CLLocationManagerDelegate

```

#### RUN THE APP (nothing happens)

Add to `getLocation()`

```swift
let authStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()
```

#### NEED TO ADD (to Info.plist)

Right click then add row
```
NSLocationWhenInUseUsageDescription : This app lets you keep track of interesting places. It needs access to the GPS coordinates for your location.
```

#### MAKE MORE USER FRIENDLY:

```swift
func showLocationServicesDeniedAlert() {
                                  message: "Please enable location services for this app in Settings.",                       
                                  preferredStyle: .Alert)
```

#### TO SHOW THE ALERT

To show this alert, add the following lines to getLocation(), just before you set the locationManager’s delegate:
```

#### SHOWS GPS DATA IN CONSOLE BUT NOT ON DISPLAY

Add: `var location: CLLocation?` to `CurrentLocationViewController.swift`

Add code below to end of `locationManager()`:

```swift

location = newLocation

```

#### FINALLY ADD

```swift
func updateLabels() {
```

#### HOPEFULLY

```swift
import UIKit
import MapKit

class MapLocationViewController: UIViewController {

    
    @IBOutlet weak var mapView: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1
        let location = CLLocationCoordinate2D(
            latitude: 51.50007773,
            longitude: -0.1246402
        )
        // 2
        let span = MKCoordinateSpanMake(0.05, 0.05)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        //3
        let annotation = MKPointAnnotation()
        annotation.setCoordinate(location)
        annotation.title = "Big Ben"
        annotation.subtitle = "London"
        mapView.addAnnotation(annotation)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
```
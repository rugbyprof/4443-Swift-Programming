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
@IBAction func getLocation() {    locationManager.delegate = self    locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters    locationManager.startUpdatingLocation()}
```

Add to bottom of file:

```swift
// MARK: - CLLocationManagerDelegatefunc locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {    println("didFailWithError \(error)")}
func locationManager(manager: CLLocationManager!,didUpdateLocations locations: [AnyObject]!) {    let newLocation = locations.last as CLLocation    println("didUpdateLocations \(newLocation)")}
```

#### RUN THE APP (nothing happens)

Add to `getLocation()`

```swift
let authStatus: CLAuthorizationStatus = CLLocationManager.authorizationStatus()if authStatus == .NotDetermined {    locationManager.requestWhenInUseAuthorization()    return}
```

#### NEED TO ADD (to Info.plist)

Right click then add row
```
NSLocationWhenInUseUsageDescription : This app lets you keep track of interesting places. It needs access to the GPS coordinates for your location.
```

#### MAKE MORE USER FRIENDLY:

```swift
func showLocationServicesDeniedAlert() {    let alert = UIAlertController(title: "Location Services Disabled", 
                                  message: "Please enable location services for this app in Settings.",                       
                                  preferredStyle: .Alert)    let okAction = UIAlertAction(title: "OK", style: .Default, handler: nil)    alert.addAction(okAction)    presentViewController(alert, animated: true, completion: nil)}
```

#### TO SHOW THE ALERT

To show this alert, add the following lines to getLocation(), just before you set the locationManager’s delegate:```swiftif authStatus == .Denied || authStatus == .Restricted {    showLocationServicesDeniedAlert()    return}
```

#### SHOWS GPS DATA IN CONSOLE BUT NOT ON DISPLAY

Add: `var location: CLLocation?` to `CurrentLocationViewController.swift`

Add code below to end of `locationManager()`:

```swift

location = newLocationupdateLabels()

```

#### FINALLY ADD

```swift
func updateLabels() {    if let location = location {        latitudeLabel.text = String(format: "%.8f", location.coordinate.latitude)        longitudeLabel.text = String(format: "%.8f", location.coordinate.longitude)        tagButton.hidden = false        messageLabel.text = ""    } else {        latitudeLabel.text = ""        longitudeLabel.text = ""        addressLabel.text = ""        tagButton.hidden = true        messageLabel.text = "Tap 'Get My Location' to Start"    }}
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

//
//  FirstViewController.swift
//  RestaurantViewer
//
//  Created by Terry Griffin on 4/6/15.
//  Copyright (c) 2015 Terry Griffin. All rights reserved.
//

import UIKit
import CoreLocation
import CoreData
import MapKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var gen = GenerateFile()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


class GenerateFile{
// Grab original json file, geocode the address, and (kind of) create a new json file with
// cleaner better info (with lat and lon).
    
    
    init(){

        let url = "http://cs.mwsu.edu/~griffin/swift/restaurants.json"

        request(.GET,url )
            .responseJSON { (req, res, json, error) in
                if(error != nil) {
                    println("Error: \(error)")
                    println(req)
                    println(res)
                } else {
                    println("Success: \(url)")
                    var json = JSON(json!)
                }

                let json = json! as [AnyObject]
                

                for loc in json {

                    let city = loc["City"] as String
                    let country = loc["Country"] as String
                    let cuisine = loc["Cuisine"] as String
                    let lat = loc["Lat"] as String
                    let lng = loc["Lng"] as String
                    let name = loc["Restaurant"] as String
                    let state = loc["State"] as String
                    let street = loc["Street"] as String
                    let telephone = loc["Telephone"] as String
                    let website = loc["Website"] as String
                    let zip = loc["Zip"] as String
                    
                    
                    let address = "\(street) , \(city) , \(zip)"
                    
                    var geocoder = CLGeocoder()
                    geocoder.geocodeAddressString(address, {(placemarks: [AnyObject]!, error: NSError!) -> Void in
                        if let placemark = placemarks?[0] as? CLPlacemark {
                            //self.mapView.addAnnotation(MKPlacemark(placemark: placemark))
                            var address = AddressParser()
                            address.parseAppleLocationData(placemark)
                            let addressDict = address.getAddressDictionary()
                            
                            let administrativeArea = addressDict["administrativeArea"] as String
                            let country = addressDict["country"] as String
                            let formattedAddress = addressDict["formattedAddress"] as String
                            let latitude = addressDict["latitude"] as String
                            let locality = addressDict["locality"] as String
                            let longitude = addressDict["longitude"] as String
                            let postalCode = addressDict["postalCode"] as String
                            let streetNumber = addressDict["streetNumber"] as String
                            let subLocality = addressDict["subLocality"] as String
                            
                            //println(addressDict)
                            let restaurant = "{\n'administrativeArea' : '\(administrativeArea)',\n 'country' : '\(country)',\n 'formattedAddress' : '\(formattedAddress)',\n 'latitude' :  '\(latitude)',\n 'longitude' : '\(longitude)',\n 'postalCode' : '\(postalCode)',\n 'streetNumber' :  '\(streetNumber)',\n 'subLocality' : '\(subLocality)',\n 'name' : '\(name)',\n 'telephone' : '\(telephone)',\n 'website' : '\(website)',\n 'cuisine' : '\(cuisine)'\n},"
                            println(restaurant)
                        }
                    })
                    

//                    locationManager.geocodeAddressString(address: address) { (geocodeInfo,placemark,error) -> Void in
//
//                        if(error != nil){
//
//                            println(error)
//
//                        }else{
//                            //println( "Type = \(_stdlib_getTypeName(geocodeInfo!))")
//  
//                            let administrativeArea = geocodeInfo!.objectForKey("administrativeArea")! as String
//                            let country = geocodeInfo!.objectForKey("country")! as String
//                            let formattedAddress = geocodeInfo!.objectForKey("formattedAddress")! as String
//                            let latitude = geocodeInfo!.objectForKey("latitude")! as String
//                            let locality = geocodeInfo!.objectForKey("locality")! as String
//                            let longitude = geocodeInfo!.objectForKey("longitude")! as String
//                            let postalCode = geocodeInfo!.objectForKey("postalCode")! as String
//                            let streetNumber = geocodeInfo!.objectForKey("streetNumber")! as String
//                            let subLocality = geocodeInfo!.objectForKey("subLocality")! as String
//                            
//                            let restaurant = "{\n'administrativeArea' : '\(administrativeArea)',\n 'country' : '\(country)',\n 'formattedAddress' : '\(formattedAddress)',\n 'latitude' :  '\(latitude)',\n 'longitude' : '\(longitude)',\n 'postalCode' : '\(postalCode)',\n 'streetNumber' :  '\(streetNumber)',\n 'subLocality' : '\(subLocality)',\n 'name' : '\(name)',\n 'telephone' : '\(telephone)',\n 'website' : '\(website)',\n 'cuisine' : '\(cuisine)'\n},"
//                            
//                            println(restaurant)
//                        }
//                    }
                    
                    

            }
        }
    }
    
}

class AddressParser: NSObject{
    
    private var latitude = NSString()
    private var longitude  = NSString()
    private var streetNumber = NSString()
    private var route = NSString()
    private var locality = NSString()
    private var subLocality = NSString()
    private var formattedAddress = NSString()
    private var administrativeArea = NSString()
    private var administrativeAreaCode = NSString()
    private var subAdministrativeArea = NSString()
    private var postalCode = NSString()
    private var country = NSString()
    private var subThoroughfare = NSString()
    private var thoroughfare = NSString()
    private var ISOcountryCode = NSString()
    private var state = NSString()
    
    
    override init(){
        
        super.init()
        
    }
    
    private func getAddressDictionary()-> NSDictionary{
        
        var addressDict = NSMutableDictionary()
        
        addressDict.setValue(latitude, forKey: "latitude")
        addressDict.setValue(longitude, forKey: "longitude")
        addressDict.setValue(streetNumber, forKey: "streetNumber")
        addressDict.setValue(locality, forKey: "locality")
        addressDict.setValue(subLocality, forKey: "subLocality")
        addressDict.setValue(administrativeArea, forKey: "administrativeArea")
        addressDict.setValue(postalCode, forKey: "postalCode")
        addressDict.setValue(country, forKey: "country")
        addressDict.setValue(formattedAddress, forKey: "formattedAddress")
        
        return addressDict
    }
    
    
    private func parseAppleLocationData(placemark:CLPlacemark){
        
        var addressLines = placemark.addressDictionary["FormattedAddressLines"] as NSArray
        
        //self.streetNumber = placemark.subThoroughfare ? placemark.subThoroughfare : ""
        self.streetNumber = placemark.thoroughfare != nil ? placemark.thoroughfare : ""
        self.locality = placemark.locality != nil ? placemark.locality : ""
        self.postalCode = placemark.postalCode != nil ? placemark.postalCode : ""
        self.subLocality = placemark.subLocality != nil ? placemark.subLocality : ""
        self.administrativeArea = placemark.administrativeArea != nil ? placemark.administrativeArea : ""
        self.country = placemark.country != nil ?  placemark.country : ""
        self.longitude = placemark.location.coordinate.longitude.description;
        self.latitude = placemark.location.coordinate.latitude.description
        if(addressLines.count>0){
            self.formattedAddress = addressLines.componentsJoinedByString(", ")}
        else{
            self.formattedAddress = ""
        }
        
        
    }
    
    
    private func parseGoogleLocationData(resultDict:NSDictionary){
        
        let locationDict = (resultDict.valueForKey("results") as NSArray).firstObject as NSDictionary
        
        let formattedAddrs = locationDict.objectForKey("formatted_address") as NSString
        
        let geometry = locationDict.objectForKey("geometry") as NSDictionary
        let location = geometry.objectForKey("location") as NSDictionary
        let lat = location.objectForKey("lat") as Double
        let lng = location.objectForKey("lng") as Double
        
        self.latitude = lat.description
        self.longitude = lng.description
        
        let addressComponents = locationDict.objectForKey("address_components") as NSArray
        
        self.subThoroughfare = component("street_number", inArray: addressComponents, ofType: "long_name")
        self.thoroughfare = component("route", inArray: addressComponents, ofType: "long_name")
        self.streetNumber = self.subThoroughfare
        self.locality = component("locality", inArray: addressComponents, ofType: "long_name")
        self.postalCode = component("postal_code", inArray: addressComponents, ofType: "long_name")
        self.route = component("route", inArray: addressComponents, ofType: "long_name")
        self.subLocality = component("subLocality", inArray: addressComponents, ofType: "long_name")
        self.administrativeArea = component("administrative_area_level_1", inArray: addressComponents, ofType: "long_name")
        self.administrativeAreaCode = component("administrative_area_level_1", inArray: addressComponents, ofType: "short_name")
        self.subAdministrativeArea = component("administrative_area_level_2", inArray: addressComponents, ofType: "long_name")
        self.country =  component("country", inArray: addressComponents, ofType: "long_name")
        self.ISOcountryCode =  component("country", inArray: addressComponents, ofType: "short_name")
        self.formattedAddress = formattedAddrs;
        
    }
    
    private func component(component:NSString,inArray:NSArray,ofType:NSString) -> NSString{
        let index:NSInteger = inArray.indexOfObjectPassingTest { (obj, idx, stop) -> Bool in
            
            var objDict:NSDictionary = obj as NSDictionary
            var types:NSArray = objDict.objectForKey("types") as NSArray
            let type = types.firstObject as NSString
            return type.isEqualToString(component)
            
        }
        
        if (index == NSNotFound){
            
            return ""
        }
        
        if (index >= inArray.count){
            return ""
        }
        
        var type = ((inArray.objectAtIndex(index) as NSDictionary).valueForKey(ofType)!) as NSString
        
        if (type.length > 0){
            
            return type
        }
        return ""
        
    }
    
    private func getPlacemark() -> CLPlacemark{
        
        var addressDict = NSMutableDictionary()
        
        var formattedAddressArray = self.formattedAddress.componentsSeparatedByString(", ") as Array
        
        let kSubAdministrativeArea = "SubAdministrativeArea"
        let kSubLocality           = "SubLocality"
        let kState                 = "State"
        let kStreet                = "Street"
        let kThoroughfare          = "Thoroughfare"
        let kFormattedAddressLines = "FormattedAddressLines"
        let kSubThoroughfare       = "SubThoroughfare"
        let kPostCodeExtension     = "PostCodeExtension"
        let kCity                  = "City"
        let kZIP                   = "ZIP"
        let kCountry               = "Country"
        let kCountryCode           = "CountryCode"
        
        addressDict.setObject(self.subAdministrativeArea, forKey: kSubAdministrativeArea)
        addressDict.setObject(self.subLocality, forKey: kSubLocality)
        addressDict.setObject(self.administrativeAreaCode, forKey: kState)
        
        addressDict.setObject(formattedAddressArray.first as NSString, forKey: kStreet)
        addressDict.setObject(self.thoroughfare, forKey: kThoroughfare)
        addressDict.setObject(formattedAddressArray, forKey: kFormattedAddressLines)
        addressDict.setObject(self.subThoroughfare, forKey: kSubThoroughfare)
        addressDict.setObject("", forKey: kPostCodeExtension)
        addressDict.setObject(self.locality, forKey: kCity)
        
        
        addressDict.setObject(self.postalCode, forKey: kZIP)
        addressDict.setObject(self.country, forKey: kCountry)
        addressDict.setObject(self.ISOcountryCode, forKey: kCountryCode)
        
        
        var lat = self.latitude.doubleValue
        var lng = self.longitude.doubleValue
        var coordinate = CLLocationCoordinate2D(latitude: lat, longitude: lng)
        
        var placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        
        return (placemark as CLPlacemark)
        
        
    }
    
}


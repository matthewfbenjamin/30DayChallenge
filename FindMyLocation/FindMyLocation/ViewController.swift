//
//  ViewController.swift
//  FindMyLocation
//
//  Created by Matthew Benjamin on 5/1/16.
//  Copyright © 2016 Matthew Benjamin. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation
class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet weak var mapView: MKMapView!
    let locationManager = CLLocationManager()
    
    
    
    @IBAction func getLocationButtonClicked(sender: AnyObject) {
        
        self.locationManager.delegate = self //conforms to delegate
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest //Gets user's exact location
        self.locationManager.requestWhenInUseAuthorization() //Uses location services only when using the app
        self.locationManager.startUpdatingLocation() //Start looking for location
        
        self.mapView.showsUserLocation = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    //MARK: -Location Delegate Methods
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations.last
        let center = CLLocationCoordinate2D(latitude: location!.coordinate.latitude, longitude: location!.coordinate.longitude) //recieves center of location
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 1, longitudeDelta: 1)) //creating a region (circle to zoom to) Smaller delta the closer the zoom
        
        self.mapView.setRegion(region, animated: true)
        self.locationManager.stopUpdatingLocation()
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print("Errors: " + error.localizedDescription)
        
    }
    
}


//
//  LocationDetailsViewController.swift
//  Giggle_sb
//
//  Created by rjk on 01/11/24.
//

import UIKit
import CoreLocation

class LocationDetailsViewController: UIViewController, CLLocationManagerDelegate  {

    @IBOutlet weak var pickLocationButton: UIButton!
    private let locationManager = CLLocationManager()
    private var currentLocation: CLLocation?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Set up location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    @IBAction func pickLocationButtonTapped(_ sender: UIButton) {
        // Request location permissions
        checkLocationPermissions()
    }
    
    private func checkLocationPermissions() {
        // Check the authorization status
        switch locationManager.authorizationStatus {
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization() // Request permission
        case .authorizedWhenInUse, .authorizedAlways:
            fetchLocationOnce()
        case .denied, .restricted:
            // Handle case where permission is denied
            showLocationDeniedAlert()
        @unknown default:
            break
        }
    }
    
    private func showLocationDeniedAlert() {
        let alert = UIAlertController(title: "Location Permission Denied",
                                      message: "Please enable location permissions in Settings to use this feature.",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true)
    }
    
    private func fetchLocationOnce() {
        // Start updating location to get current location
        locationManager.requestLocation()
    }
    
    // MARK: - CLLocationManagerDelegate
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        // Get the user's current location
        if let location = locations.last {
            currentLocation = location
            print("Current location: \(location.coordinate.latitude), \(location.coordinate.longitude)")
            
            // Store the location or use it as needed
            storeUserLocation(location)
            performSegue(withIdentifier: "goToEducationDetailsScreen", sender: self)
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        // Check if permission was granted and fetch location if so
        if status == .authorizedWhenInUse || status == .authorizedAlways {
            fetchLocationOnce()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Failed to get location: \(error.localizedDescription)")
    }
    
    private func storeUserLocation(_ location: CLLocation) {
        // Here you can save the location to your database or use it as needed
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        print("Stored location: Latitude: \(latitude), Longitude: \(longitude)")
        
        // Example: Store in UserDefaults (replace this with your preferred storage method)
        UserDefaults.standard.set(latitude, forKey: "userLatitude")
        UserDefaults.standard.set(longitude, forKey: "userLongitude")
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

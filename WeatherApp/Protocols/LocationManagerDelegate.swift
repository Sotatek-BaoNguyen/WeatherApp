import CoreLocation

protocol LocationManagerDelegate: AnyObject {
    func locationManager(_ manager: LocationManagerProtocol, didUpdateLocations locations: [LocationProtocol])
    func locationManager(_ manager: LocationManagerProtocol, didFailWithError error: Error)
}

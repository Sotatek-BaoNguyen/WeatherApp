import CoreLocation

extension CLLocationManager: LocationManagerProtocol {
    var locationManagerDelegate: LocationManagerDelegate? {
        get {
            return delegate as? LocationManagerDelegate
        }
        set {
            delegate = newValue as? CLLocationManagerDelegate
        }
    }
}

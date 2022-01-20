import CoreLocation

protocol LocationManagerProtocol {
    var locationManagerDelegate: LocationManagerDelegate? { get set }
    var desiredAccuracy: Double { get set }
    func startUpdatingLocation()
    func requestWhenInUseAuthorization()
    func stopUpdatingLocation()
}

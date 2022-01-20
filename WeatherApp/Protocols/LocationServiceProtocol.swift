import CoreLocation

protocol LocationServiceProtocol {
    var locationManager: LocationManagerProtocol { get set }
    init(manager: LocationManagerProtocol)
    func getCurrentLocation(completion: @escaping (LocationProtocol) -> Void)
}

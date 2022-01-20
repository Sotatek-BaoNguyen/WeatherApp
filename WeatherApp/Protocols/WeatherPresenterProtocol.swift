import Foundation

protocol WeatherPresenterProtocol {
  var view: WeatherViewProtocol { get set }
  var service: APIClientProtocol { get set }
  var locationService: LocationServiceProtocol { get set }
  init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol)
  func showWeather(for woeid: Int)
  func updateCurrentLocation()
  func getLocationMatches(_ city: String, completion: @escaping ([WeatherLocation]) -> Void)
}

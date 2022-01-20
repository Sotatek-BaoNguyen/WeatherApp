import UIKit

class WeatherPresenter: WeatherPresenterProtocol {
  var view: WeatherViewProtocol
  var service: APIClientProtocol
  var locationService: LocationServiceProtocol
  var urlBuilder: URLBuilderProtocol?
  
  required init(view: WeatherViewProtocol, service: APIClientProtocol, locationService: LocationServiceProtocol) {
    self.view = view
    self.service = service
    self.locationService = locationService
  }
  
  func updateCurrentLocation() {
    view.setInformationPanel("Updating your location...")
    locationService.getCurrentLocation { currentLocation in
      self.getLocationMatches(from: currentLocation) { locationMatches in
        guard let woeid = locationMatches.first?.woeid else { return }
        self.showWeather(for: woeid)
      }
    }
  }
  
  func getLocationMatches(_ city: String, completion: @escaping ([WeatherLocation]) -> Void) {
    view.setInformationPanel("Getting location matches from API...")
    let query = "\(city)"
    guard let url = urlBuilder?.build(for: .searchCity, with: query) else { return }
    service.fetch(dataType: [WeatherLocation].self, from: url) { result in
      switch result {
        case .success(let locations):
          completion(locations)
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
  func getLocationMatches(from coordinate: LocationProtocol, completion: @escaping ([WeatherLocation]) -> Void) {
    view.setInformationPanel("Getting location matches from API...")
    let query = "\(coordinate.latitude),\(coordinate.longitude)"
    guard let url = urlBuilder?.build(for: .locations, with: query) else { return }
    
    service.fetch(dataType: [WeatherLocation].self, from: url) { result in
      switch result {
        case .success(let locations):
          completion(locations)
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
  func showWeather(for woeid: Int) {
    guard let url = urlBuilder?.build(for: .woeid, with: String(woeid)) else { return }
    service.fetch(dataType: WeatherResponse.self, from: url) { result in
      switch result {
        case .success(let response):
          self.view.setWeather(weatherResponse: response)
          guard let weather = response.weather.first else { return }
          self.fetchWeatherIcon(for: weather.stateAbbreviation)
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
  
  func fetchWeatherIcon(for state: String) {
    guard let url = urlBuilder?.build(for: .icon, with: state) else { return }
    service.fetchRawData(from: url) { result in
      switch result {
        case .success(let data):
          if let image = UIImage(data: data) {
            self.view.setWeatherImage(with: image)
          }
        case .failure(let error):
          print(error.localizedDescription)
      }
    }
  }
}

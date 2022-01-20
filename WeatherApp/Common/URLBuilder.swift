import Foundation

enum Endpoint: String {
  case icon = "/static/img/weather/png"
  case locations = "/api/location/search/?lattlong="
  case woeid = "/api/location"
  case searchCity = "/api/location/search/?query="
//  case locationDay = "/api/location/(woeid)/(date)/"
}

class URLBuilder: URLBuilderProtocol {
  var baseURLString: String
  
  required init(baseURL: String) {
    self.baseURLString = baseURL
  }
  
  func build(for endpoint: Endpoint, with query: String) -> URL? {
    switch endpoint {
      case.icon:
        return URL(string: "\(baseURLString)\(endpoint.rawValue)/\(query).png")
      case .locations:
        return URL(string: "\(baseURLString)\(endpoint.rawValue)\(query)")
      case .searchCity:
        return URL(string: "\(baseURLString)\(endpoint.rawValue)\(query)")
      case .woeid:
        return URL(string: "\(baseURLString)\(endpoint.rawValue)/\(query)")
    }
  }
}

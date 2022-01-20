import Foundation

struct Weather: Decodable {   
  let temperature: Double
  let state: String
  let stateAbbreviation: String
  let windSpeed: Double
  let windDirection: Double
  let minTemp: Double
  let maxTemp: Double
  let humidity: Double
  let visibility: Double
  let airPressure: Double
  
  private enum CodingKeys: String, CodingKey {
    case state = "weather_state_name"
    case stateAbbreviation = "weather_state_abbr"
    case windSpeed = "wind_speed"
    case windDirection = "wind_direction"
    case temperature = "the_temp"
    case minTemp = "min_temp"
    case maxTemp = "max_temp"
    case humidity
    case visibility
    case airPressure = "air_pressure"
  }
}

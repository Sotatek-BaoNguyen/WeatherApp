import UIKit

enum DegreeType {
  case C
  case F
}

class WeatherViewController: UIViewController, WeatherViewProtocol {  
  var presenter: WeatherPresenterProtocol?
  var dispatchQueue: DispatchQueueProtocol = DispatchQueue.main
  
  @IBOutlet weak var weatherIconImageView: UIImageView!
  @IBOutlet weak var titleLabel: UILabel!
  @IBOutlet weak var temperatureLabel: UILabel!
  @IBOutlet weak var timeLabel: UILabel!
  @IBOutlet weak var minDegree: UILabel!
  @IBOutlet weak var maxDegree: UILabel!
  @IBOutlet weak var windSpeed: UILabel!
  @IBOutlet weak var windDirection: UILabel!
  @IBOutlet weak var humidityLabel: UILabel!
  @IBOutlet weak var visibilityLabel: UILabel!
  @IBOutlet weak var airePressureLabel: UILabel!
  @IBOutlet weak var informationPanel: UILabel!
  @IBOutlet weak var searchTextField: UITextField!
  
  var degreeType: DegreeType = .C
  var weather: Weather!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    if let presenter = presenter {
      presenter.updateCurrentLocation()
    }
    
    searchTextField.delegate = self
  }
  
  func setWeather(weatherResponse: WeatherResponse) {
    dispatchQueue.async {
      self.titleLabel.attributedText = "\(weatherResponse.title), \(weatherResponse.locationInfo.countryName)".center()
      guard let weather = weatherResponse.weather.first else { return }
      self.weather = weather
      let temperature = round(weather.temperature)
      self.temperatureLabel.attributedText = "\(temperature) °C".center()
      self.setInformationPanel("Weather updated at \(Date().toShortTime())")
      self.timeLabel.text = weatherResponse.time
      self.minDegree.attributedText = "Min: \(weather.minTemp) °C".center()
      self.maxDegree.attributedText = "Max: \(weather.maxTemp) °C".center()
      self.windSpeed.text = "Wind speed: \(weather.windSpeed)"
      self.windDirection.text = "Wind direction: \(weather.windDirection)"
      self.humidityLabel.text = "Humidity: \(weather.humidity)"
      self.visibilityLabel.text = "Visibility: \(weather.visibility)"
      self.airePressureLabel.text = "Air pressure: \(weather.airPressure)"
    }
  }
  
  func setWeatherImage(with image: UIImage) {
    DispatchQueue.main.async {
      self.weatherIconImageView.image = image
    }
  }
  
  func setInformationPanel(_ text: String) {
    informationPanel.text = text
  }
  
  @IBAction func convert(_ sender: Any) {
    if degreeType == .C {
      degreeType = .F
      toF()
    } else if degreeType == .F {
      degreeType = .C
      toC()
    }
  }
  
  func toF() {
    let temperature = round(weather.temperature) * 9/5 + 32
    self.temperatureLabel.attributedText = "\(temperature) °F".center()
    self.minDegree.attributedText = "Min: \(weather.minTemp * 9/5 + 32) °F".center()
    self.maxDegree.attributedText = "Max: \(weather.maxTemp * 9/5 + 32) °F".center()
  }
  
  func toC() {
    let temperature = round(weather.temperature)
    self.temperatureLabel.attributedText = "\(temperature) °C".center()
    self.minDegree.attributedText = "Min: \(weather.minTemp) °C".center()
    self.maxDegree.attributedText = "Max: \(weather.maxTemp) °C".center()
  }
  
  @IBAction func refreshWeather(_ sender: Any) {
    presenter?.updateCurrentLocation()
  }
}

extension WeatherViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if textField == searchTextField {
      if let presenter = presenter {
        presenter.getLocationMatches(textField.text ?? "") { locationMatches in
          guard let woeid = locationMatches.first?.woeid else { return }
          
          presenter.showWeather(for: woeid)
        }
      }
    }
    return true
  }
}

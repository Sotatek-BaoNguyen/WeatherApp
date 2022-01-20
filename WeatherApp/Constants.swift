import Foundation

struct Constants {
    struct API {
        static let baseURL = "https://www.metaweather.com"
        static let jsonResponseExample = """
            {
                "consolidated_weather": [
                    {
                        "id": 6632104114782208,
                        "weather_state_name": "Light Rain",
                        "weather_state_abbr": "lr",
                        "wind_direction_compass": "S",
                        "created": "2020-04-28T18:37:25.458087Z",
                        "applicable_date": "2020-04-28",
                        "min_temp": 14.17,
                        "max_temp": 23.064999999999998,
                        "the_temp": 21.84,
                        "wind_speed": 7.206528976833957,
                        "wind_direction": 182.32488658757788,
                        "air_pressure": 1017.5,
                        "humidity": 62,
                        "visibility": 11.881549252366181,
                        "predictability": 75
                    },
                    {
                        "id": 5060710352551936,
                        "weather_state_name": "Light Rain",
                        "weather_state_abbr": "lr",
                        "wind_direction_compass": "SSW",
                        "created": "2020-04-28T18:37:28.512348Z",
                        "applicable_date": "2020-04-29",
                        "min_temp": 11.39,
                        "max_temp": 20.57,
                        "the_temp": 17.91,
                        "wind_speed": 7.522279166144384,
                        "wind_direction": 201.05089437108745,
                        "air_pressure": 1011,
                        "humidity": 76,
                        "visibility": 14.192739401892945,
                        "predictability": 75
                    },
                    {
                        "id": 6186610259394560,
                        "weather_state_name": "Showers",
                        "weather_state_abbr": "s",
                        "wind_direction_compass": "SW",
                        "created": "2020-04-28T18:37:31.527212Z",
                        "applicable_date": "2020-04-30",
                        "min_temp": 9.19,
                        "max_temp": 19.564999999999998,
                        "the_temp": 17.875,
                        "wind_speed": 6.150766754622339,
                        "wind_direction": 214.58570714517467,
                        "air_pressure": 1014,
                        "humidity": 62,
                        "visibility": 14.857295891990773,
                        "predictability": 73
                    },
                    {
                        "id": 6024239272427520,
                        "weather_state_name": "Light Cloud",
                        "weather_state_abbr": "lc",
                        "wind_direction_compass": "SW",
                        "created": "2020-04-28T18:37:34.628255Z",
                        "applicable_date": "2020-05-01",
                        "min_temp": 11.75,
                        "max_temp": 22.32,
                        "the_temp": 21.045,
                        "wind_speed": 6.8323490340120365,
                        "wind_direction": 233.76730224058025,
                        "air_pressure": 1016,
                        "humidity": 56,
                        "visibility": 13.445540543227551,
                        "predictability": 70
                    },
                    {
                        "id": 4696711874215936,
                        "weather_state_name": "Light Cloud",
                        "weather_state_abbr": "lc",
                        "wind_direction_compass": "WSW",
                        "created": "2020-04-28T18:37:37.457182Z",
                        "applicable_date": "2020-05-02",
                        "min_temp": 13.24,
                        "max_temp": 25.439999999999998,
                        "the_temp": 23.955,
                        "wind_speed": 5.0868447619846755,
                        "wind_direction": 236.3745059533939,
                        "air_pressure": 1014.5,
                        "humidity": 57,
                        "visibility": 13.374082856120257,
                        "predictability": 70
                    },
                    {
                        "id": 5551762553438208,
                        "weather_state_name": "Light Cloud",
                        "weather_state_abbr": "lc",
                        "wind_direction_compass": "WSW",
                        "created": "2020-04-28T18:37:40.512366Z",
                        "applicable_date": "2020-05-03",
                        "min_temp": 14.175,
                        "max_temp": 27.509999999999998,
                        "the_temp": 27.29,
                        "wind_speed": 3.8160932156207745,
                        "wind_direction": 257,
                        "air_pressure": 1015,
                        "humidity": 58,
                        "visibility": 9.999726596675416,
                        "predictability": 70
                    }
                ],
                "time": "2020-04-28T23:27:09.458420+02:00",
                "sun_rise": "2020-04-28T06:09:54.182584+02:00",
                "sun_set": "2020-04-28T20:05:42.742894+02:00",
                "timezone_name": "RMT",
                "parent": {
                    "title": "Italy",
                    "location_type": "Country",
                    "woeid": 23424853,
                    "latt_long": "42.503819,12.573470"
                },
                "sources": [
                    {
                        "title": "BBC",
                        "slug": "bbc",
                        "url": "http://www.bbc.co.uk/weather/",
                        "crawl_rate": 360
                    },
                    {
                        "title": "Forecast.io",
                        "slug": "forecast-io",
                        "url": "http://forecast.io/",
                        "crawl_rate": 480
                    },
                    {
                        "title": "HAMweather",
                        "slug": "hamweather",
                        "url": "http://www.hamweather.com/",
                        "crawl_rate": 360
                    },
                    {
                        "title": "Met Office",
                        "slug": "met-office",
                        "url": "http://www.metoffice.gov.uk/",
                        "crawl_rate": 180
                    },
                    {
                        "title": "OpenWeatherMap",
                        "slug": "openweathermap",
                        "url": "http://openweathermap.org/",
                        "crawl_rate": 360
                    },
                    {
                        "title": "Weather Underground",
                        "slug": "wunderground",
                        "url": "https://www.wunderground.com/?apiref=fc30dc3cd224e19b",
                        "crawl_rate": 720
                    },
                    {
                        "title": "World Weather Online",
                        "slug": "world-weather-online",
                        "url": "http://www.worldweatheronline.com/",
                        "crawl_rate": 360
                    }
                ],
                "title": "Rome",
                "location_type": "City",
                "woeid": 721943,
                "latt_long": "41.903111,12.495760",
                "timezone": "Europe/Rome"
            }
        """
    }
}

## [SweaterWeather](https://backend.turing.edu/module3/projects/sweater_weather/)

A week long project, completed during my time at Turing. It is an API only Ruby on Rails backend that utilizes:
the Mapquest API for geo-coordiantes and directions,
OpenWeather API for current, hourly and daily weather
and Google Places API for pictures from the locations.

The Project Scope: 
1. to be able to get forecasts for cities that users specify 
(using the geo-coordinates returned from Mapquest to get the weather data from OpenWeather)
2. return a background image for those cities
(using Google Places API to search for images from the city)
3. Allow users to register and return to them a unique API key, which was needed to access some of our endpoints
4. allow User login via hashed passwords with Bcrypt
5. Allow users to create a RoadTrip, in which they designate an origin and destination city, and return to them the forecasted weather for their arrival time!
(using the forecast data from the API in goal 1 and the Mapquest directions API to estimate the arrival time)

This project required the use of all of the external API's working in conjuncture to provide the users with a seamless experience. 

[link to lucid charts process diagrams]()
* Ruby version
![Version][version-badge]

Testing

1. service returns parsed data (or simple data as in GeoLocationService.get_coordinates()) 
2. facade takes service send to Serializer 
3. Serializer formats data to JSON 
3. controller renders data to the client via specified API endpoints. 

Steps to returning forecast object
1. coordinates = GeoLocationService.get_coordinates(location_name)
2. forecast = ForcastService.get_forecast(coordinates)
3. ForecastFacade.format_forcast(forecast)
4. forecasts controller index calls facade and renders json 

### Get Weather Forecast Data
```json
{
    "data": {
        "id": null,
        "type": "forecast",
        "attributes": {
            "current_weather": {
                "datetime": "2021-11-12T16:45:37.000-07:00",
                "sunrise": "2021-11-12T05:23:19.000-07:00",
                "sunset": "2021-11-12T15:14:12.000-07:00",
                "temperature": 38.52,
                "feels_like": 38.52,
                "humidity": 82,
                "uvi": 0,
                "visibility": 10000,
                "conditions": "Clouds + overcast clouds",
                "icon": "04n"
            },
            "daily_weather": [
                {
                    "date": "2021-11-12T10:00:00.000-07:00",
                    "sunrise": "2021-11-12T05:23:19.000-07:00",
                    "sunset": "2021-11-12T15:14:12.000-07:00",
                    "max_temp": 48.54,
                    "min_temp": 35.64,
                    "conditions": "Rain + light rain",
                    "icon": "10d"
                }... * 5 days
            ],
            "hourly_weather": [
                {
                    "time": "2021-11-12T16:00:00.000-07:00",
                    "temp": 38.8,
                    "conditions": "Clouds + overcast clouds",
                    "icon": "04n"
                }... * 8 hours
            ]
        }
}
```

### Get a random Image from the destination city (using google places)
```json
{
    "data": {
        "id": null,
        "type": "image",
        "attributes": {
            "image_url": "https://lh3.googleusercontent.com/places/AAcXr8qnLw24WJ63Gz-6VsY1mmKdVEymztBCWEaqW-NZJ21VOjVHnaZootIC4VsYgOuy_oumb2iChYauRsI5FgwzlxpzkqNOqRtc-e4=s1600-w800",
            "location": "detroit,mi"
        }
    }
}
```

### Road Trip NY => LA
```json
{
    ":data": {
        ":id": null,
        ":type": "roadtrip",
        ":attributes": {
            ":start_city": "los angeles, ca",
            ":end_city": "new york, ny",
            ":travel_time": "40 hours 21 minutes",
            ":weather_at_eta": {
                ":temperature": 41.63,
                ":conditions": "few clouds"
            }
        }
    }
}
```
* Database creation / initialization
in the terminal: 
- bundle install
- rails db:{create,migrate}

* How to run the test suite
- bundle exec rspec

* Deployment instructions
- rails s

## [SweaterWeather](https://backend.turing.edu/module3/projects/sweater_weather/)

A week long project, completed during my time at Turing. It is an API only Ruby on Rails backend that utilizes:
the Mapquest API for geo-coordiantes and directions,
OpenWeather API for current, hourly and daily weather
and Google Places API for pictures from the locations.

The goal was:
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


* Database creation / initialization
in the terminal: 
- bundle install
- rails db:{create,migrate}

* How to run the test suite
- bundle exec rspec

* Deployment instructions
- rails s

# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
2.7.2

Testing

1. service returns parsed data (or simple data as in GeoLocationService.get_coordinates()) 
2. facade takes service returns and formats for controller
3. controller renders JSON data in specified format

Steps to returning forecast object
1. coordinates = GeoLocationService.get_coordinates(location_name)
2. forecast = ForcastService.get_forecast(coordinates)
3. ForecastFacade.format_forcast(forecast)
4. forecasts controller index calls facade and renders json 


* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

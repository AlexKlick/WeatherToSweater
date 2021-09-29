class ForecastSerializer
  include JSONAPI::Serializer
  def self.serialize(forecast_data)
    daily_arr = []
    5.times do |i|
      day = {
        date: Time.at(forecast_data[:daily][i][:dt]).to_datetime,
        sunrise: Time.at(forecast_data[:daily][i][:sunrise]).to_datetime,
        sunset: Time.at(forecast_data[:daily][i][:sunset]).to_datetime,
        max_temp: forecast_data[:daily][i][:temp][:max],
        min_temp: forecast_data[:daily][i][:temp][:min],
        conditions: "#{forecast_data[:daily][i][:weather][0][:main]} + #{forecast_data[:daily][i][:weather][0][:description]}",
        icon: forecast_data[:daily][i][:weather][0][:icon]
      }
      daily_arr << day
    end
    hourly_arr = []
      8.times do |i| 
      hour = {
        time: Time.at(forecast_data[:hourly][i][:dt]).to_datetime,
        temp: forecast_data[:hourly][i][:temp],
        conditions: "#{forecast_data[:hourly][i][:weather][0][:main]} + #{forecast_data[:hourly][i][:weather][0][:description]}",
        icon: forecast_data[:hourly][i][:weather][0][:icon]
      }
      hourly_arr << hour
    end

    object = { 
      data: {
        id: nil,
        type: "forecast",
        attributes: {
          current_weather: {
            datetime: Time.at(forecast_data[:current][:dt]).to_datetime,
            sunrise: Time.at(forecast_data[:current][:sunrise]).to_datetime,
            sunset: Time.at(forecast_data[:current][:sunset]).to_datetime,
            temperature: forecast_data[:current][:temp],
            feels_like: forecast_data[:current][:feels_like],
            humidity: forecast_data[:current][:humidity],
            uvi: forecast_data[:current][:uvi],
            visibility: forecast_data[:current][:visibility],
            conditions: "#{forecast_data[:current][:weather][0][:main]} + #{forecast_data[:current][:weather][0][:description]}",
            icon: forecast_data[:current][:weather][0][:icon]
          },
          daily_weather: daily_arr,
          hourly_weather: hourly_arr
        }
      }
    }
    Oj.dump(object, mode: :compat, time_format: :ruby)
  end
end

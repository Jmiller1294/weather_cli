class WeatherCli::API
  
  ROOT_URL = 'https://www.metaweather.com/api/location/'
  
  def self.no_response
    @@no_response 
  end
  
  
  def self.get_woeid(user_city)
    #sample url: https://www.metaweather.com/api/location/search/?query=chicago
    # get the site woeid ID to pull 5 day forecate for the city
    response = HTTParty.get(ROOT_URL + "search/?query=#{user_city}")
    # resp = HTTParty.get("https://www.metaweather.com/api/location/search/?query=#{user_city}")
    # response[0]['woeid'] #=> returns 2379574, from hash "woeid"=>2379574"
    name = response[0]['title']
    
    @@no_response = false
    if response == nil 
      @@no_response = true
    else
      name = response[0]['title']
      self.get_forecast_for_city(response[0]['woeid'], name)
    end
  end
  
  
  def self.create_from_array(response, name)
    #Creates an array form hash response 
    response["consolidated_weather"].each do |weather|
      date = weather["applicable_date"]
      weather_state_name = weather["weather_state_name"]
      current_temp = weather["the_temp"]
      max_temp = weather["max_temp"]
      min_temp = weather["min_temp"]
      wind_speed = weather["wind_speed"]
      humidity = weather["humidity"]
      #Creates a new WeatherCli::Forecast object 
      WeatherCli::Forecast.new(name, date, weather_state_name, current_temp, max_temp, min_temp, wind_speed, humidity)
    end
  end
       
  
  def self.get_forecast_for_city(site_id, name)
    # sample url: https://www.metaweather.com/api/location/2379574/
    response = HTTParty.get(ROOT_URL + site_id.to_s)
    # resp = HTTParty.get("https://www.metaweather.com/api/location/#{site_id}")

    #uses the class method create_from_array 
    self.create_from_array(response, name)
  end

end
 






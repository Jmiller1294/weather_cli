
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
    print_weather
   
  end
  
  
  def print_weather
    # input = nil 
    
    # puts "Would you like to know the weather?"
    # input = gets
    #   if input == 'y'|| input == 'Y'|| input == "yes"|| input == "Yes"
    
    puts "Type in a city to get its 5 day forecast"
    name = gets
    
    WeatherCli::API.get_woeid(name)
    WeatherCli::Forecast.all.each do |weather|
  
      puts ""
      puts "The weather for #{name.upcase}on #{weather.date} is "
      puts "-----------------------------------------------------"
      puts "Weather Type:           #{weather.weather_state_name}"       
      puts "Current Temperature:    #{((weather.current_temp * 9/5) + 32).round()} °F"
      puts "Minimun Temperature:    #{((weather.min_temp * 9/5) + 32).round()} °F"
      puts "Maximum Temperature:    #{((weather.max_temp * 9/5) + 32).round()} °F"
      puts "Wind Speed:             #{weather.wind_speed.round(1)} mph"
      puts "Humidity:               #{weather.humidity}%"
      puts "-----------------------------------------------------"
   end
   
  #   else
  #     goodbye
  # end
end
  
  
  
  
    
 
  
  
  def goodbye
   puts  "\nSee you next time for more weather updates, Goodbye!"
  end
end
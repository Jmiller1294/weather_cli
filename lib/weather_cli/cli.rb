
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
   location 
   get_weather(name)
   #get_date
   #get_weather_state
   goodbye
  end
  
  
  def print_weather
    puts "Type in a city to get its 5 day forecast"
    name = gets
    
    puts WeatherCli::API.get_woeid(name)
    WeatherCli::Forecast.all.each do |weather|
  
      puts ""
      puts "----------- The weather for #{name} on #{weather.date} is -----------"
      puts ""
      puts "Weather Type:           #{weather.weather_state_name}"
      puts "Current Temperature:    #{weather.current_temp}"
      puts "Minimun Temperature:    #{weather.min_temp}"
      puts "Maximum Temperature:    #{weather.max_temp}"
      puts "Wind Speed:             #{weather.wind_speed}"
      puts "Humidity:               #{weather.humidity}"
      puts ""
   
   end
  end
  
  
  
  
    
  def location
    
    input = nil 
    
    puts "Would you like to know the weather?"
    input = gets
      if input == 'y'|| input == 'Y'|| input == "yes"|| input == "Yes"
        while input != "exit"
            
          
          
          
          end
        end
      end
  
  
  def goodbye
   puts  "\nSee you next time for more weather updates, Goodbye!"
  end
end
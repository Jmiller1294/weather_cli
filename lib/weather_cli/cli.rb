
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
   puts "---------------------------------------"
   puts " Hello Welcome to the City Weather App "
   puts "---------------------------------------"
   print_weather
   
    
  end
  
  
  def print_weather
    
    
    puts "Type in a city to get its 5 day forecast:"
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
   
   puts "Would you like to get the 5 day forecast for another city?"
    input = gets.strip.downcase
    if input == 'y' || input == "yes"
      print_weather
    elsif input == "n" || input == "no"
      puts ""
      puts  "See you next time for more weather updates, Goodbye!"
      exit
    else
      puts ""
      puts "Invalid answer Enter Yes or No."
      print_weather
    end
  end
  
end
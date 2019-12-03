
class WeatherCli::CLI
  
  attr_accessor :name
  
  #method used to start the program
  def call 
   puts "---------------------------------------"
   puts " Hello, Welcome to the City Weather App "
   puts "---------------------------------------"
   start
  end
  
  
  def start
    
    #gets input from the user
    puts "Type in a city to get its 6 day forecast:"
    
    @name = gets
    
    # Uses the API class method get_woeid and passes the users input as an arguement
    WeatherCli::API.get_woeid(@name)
   
    puts ""
    print_weather
    puts ""
    puts "type in 1-6 to get more information on that day "
    input = gets.strip

    day = WeatherCli::Forecast.find(input.to_i)
    
    print_weather_day(day)
   
    #Ask the user if the would like to start the program over again
    puts "Would you like to see the weather for another day? "
    input = gets.strip.downcase
      if input == 'y' || input == "yes"
        WeatherCli::Forecast.clear_all
        start
      elsif input == "n" || input == "no"
        puts ""
        puts  "See you next time for more weather updates, Goodbye!"
        exit
      else
        puts ""
        puts "Invalid answer. Enter Yes or No."
        WeatherCli::Forecast.clear_all
        start
      end
  end
  
  
  def print_weather
    WeatherCli::Forecast.all.each.with_index(0) do |weather, index|
      puts "#{index + 1}. The weather for #{@name.upcase} on #{weather.date}."
    end
  end
  
  
  # WeatherCli::Forecast.all.each do |weather|
      
  #     #Prints the variables from the Forecast class
  #     puts ""
  #     puts "The weather for #{name.upcase}on #{weather.date} is: "
  #     puts "-----------------------------------------------------"
  #     puts "Weather Type:           #{weather.weather_state_name}"       
  #     puts "Current Temperature:    #{((weather.current_temp*9/5) + 32).round()} °F"
  #     puts "Maximun Temperature:    #{((weather.max_temp * 9/5) + 32).round()} °F"
  #     puts "Minimum Temperature:    #{((weather.min_temp * 9/5) + 32).round()} °F"
  #     puts "Wind Speed:             #{weather.wind_speed.round(1)} mph"
  #     puts "Humidity:               #{weather.humidity}%"
  #     puts "-----------------------------------------------------"
  #   end
  
  def print_weather_day(day)
     #Prints the variables from the Forecast class
    puts ""
    puts "The weather for #{@name.upcase} on #{day.date} is: "
    puts "-----------------------------------------------------"
    puts "Weather Type:           #{day.weather_state_name}"       
    puts "Current Temperature:    #{((day.current_temp*9/5) + 32).round()} °F"
    puts "Maximun Temperature:    #{((day.max_temp * 9/5) + 32).round()} °F"
    puts "Minimum Temperature:    #{((day.min_temp * 9/5) + 32).round()} °F"
    puts "Wind Speed:             #{day.wind_speed.round(1)} mph"
    puts "Humidity:               #{day.humidity}%"
    puts "-----------------------------------------------------"
  end
end

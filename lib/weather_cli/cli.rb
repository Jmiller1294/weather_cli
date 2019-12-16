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
    name = gets.strip
    
    if name == "exit"
      exit
    else
    # Uses the API class method get_woeid and passes the users input as an arguement
      
      check_response
      more_info
      puts "Would you like to search for another city? "
      input = gets.strip.downcase
    while input != "exit"
    if input == "exit"
      exit
    else
      if input == 'y' || input == "yes"
        
        start
      elsif input == "n" || input == "no"
        puts ""
        puts  "See you next time for more weather updates, Goodbye!"
        exit
      else
        puts ""
        puts "Invalid answer. Enter Yes or No."
       
        
      end 
    end
    end
  end
end
  
  
  def check_response
    if WeatherCli::API.no_response == true
      puts "Sorry the app cant find that city"
      start
    else
      puts ""
      print_weather
      puts ""
    end
  end

  
  def more_info
    puts "Type in 1-6 to get a detailed report for one these dates"
    input = gets.strip.downcase
    if input == "exit"
      exit
    else
      if input.to_i >= 1 && input.to_i <= 6
        day = WeatherCli::Forecast.find(input.to_i)
        print_weather_day(day)
      else
        puts "Wrong number entered, please enter number 1-6"
        more_info
      end
    end
  end
  
  

  
  
  def print_weather
    WeatherCli::Forecast.all.each.with_index(0) do |weather, index|
      puts "#{index + 1}. #{weather.date}."
    end
  end
  
  
  def print_weather_day(day)
    #Prints the variables from the Forecast class
    puts ""
    puts "The weather for #{day.name.upcase} on #{day.date} is: "
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

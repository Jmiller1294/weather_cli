class WeatherCli::CLI
  
 
  
  #method used to start the program
  def call 
   puts "---------------------------------------"
   puts " Hello, Welcome to the City Weather App "
   puts "---------------------------------------"
   start
  end
  
  
  def start
    input = ""
    while input !="exit"
      puts "Type in a city to get its 6 day forecast:"
      input = gets.strip
      puts""
    
      if input  == "exit"
        puts "Goodbye!"
      else
        forecast_array = WeatherCli::Forecast.find_or_create_by_city_name(input)
        check_response
        print_weather_list(forecast_array)
        more_info(forecast_array)
      
        puts "Would you like to search for another city? "
        input = gets.strip.downcase
      
        case input 
          when "exit"
            puts "Goodbye!"
          when "no"
            puts ""
            puts  "See you next time for more weather updates, Goodbye!"
            exit
          when "n" 
            puts ""
            puts  "See you next time for more weather updates, Goodbye!"
            exit
          when "yes"
            puts "Ok" 
          when 'y'
            puts "Ok" 
          else
            puts ""
            puts "Invalid answer. Enter Yes or No."
            start
        end
      end 
    end
  end

  
  def check_response
    if WeatherCli::API.no_response == true
      puts "Sorry the app cant find that city"
      start
    end
  end


  def print_weather_list(forecast_array)
    forecast_array.each.with_index(0) do |weather, index|
      puts "#{index + 1}. #{weather.date}."
    end
  end
  
  
  def more_info(forecast_array)
    puts ""
    puts "Type in 1-6 to get a detailed report for one these dates"
    input = gets.strip.downcase
    if input == "exit"
      exit
    else
      if input.to_i >= 1 && input.to_i <= 6
        day = forecast_array[input.to_i-1]
        print_weather_day(day)
      else
        puts "Wrong number entered, please enter number 1-6"
        more_info
      end
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

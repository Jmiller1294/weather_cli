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
    WeatherCli::Forecast.find_or_create_by_city_name(input)
    check_response
    check_array
    if input  == "exit"
        puts "Goodbye!"
      else
        puts "Would you like to search for another city? "
        input = gets.strip.downcase
        if input == "exit"
          puts "Goodbye!"
        else
          if input == 'y' || input == "yes"
            puts "Ok" 
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
    end
  end

  def check_array
    if WeatherCli::Forecast.array.empty?
      puts ""
      print_weather
      more_info
      puts ""
    else
      puts ""
      print_weather_array
      more_info_from_array
      puts ""
    end
  end
  
  
  
  def more_info
    puts ""
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
  
  def more_info_from_array
    puts "Type in 1-6 to get a detailed report for one these dates"
    input = gets.strip.downcase
    if input == "exit"
      exit
    else
      if input.to_i >= 1 && input.to_i <= 6
        day = WeatherCli::Forecast.find_from_array(input.to_i)
        print_weather_day(day)
      else
        puts "Wrong number entered, please enter number 1-6"
        more_info_from_array
      end
    end
  end
  

  def print_weather
    WeatherCli::Forecast.all.last(6).each.with_index(0) do |weather, index|
      puts "#{index + 1}. #{weather.date}."
    end
  end
  
  
  def print_weather_array
    WeatherCli::Forecast.array.each.with_index(0) do |weather, index|
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

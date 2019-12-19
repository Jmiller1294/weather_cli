class WeatherCli::CLI
  
  # @@sample_data = [
  #   [-7.1899999999999995, "2019-12-19",54,-4.92,-10.965,"Boston","Clear",11.205149853821682],
  #   [-3.9000000000000004,"2019-12-20",60,-1.7,-8.04,"Boston","Clear",7.707110488756331],
  #   [-1.9,"2019-12-21",66,0.02999999999999997,-6.88,"Boston","Heavy Cloud",2.4374862894641955],
# #<WeatherCli::Forecast:0x00000000027004c0
#   @current_temp=3.23,
#   @date="2019-12-22",
#   @humidity=67,
#   @max_temp=4.615,
#   @min_temp=-3.25,
#   @name="Boston",
#   @weather_state_name="Light Cloud",
#   @wind_speed=5.698280536599593>,
# #<WeatherCli::Forecast:0x0000000002700498
#   @current_temp=5.52,
#   @date="2019-12-23",
#   @humidity=70,
#   @max_temp=5.824999999999999,
#   @min_temp=-0.5750000000000001,
#   @name="Boston",
#   @weather_state_name="Clear",
#   @wind_speed=5.5608009339192455>,
# #<WeatherCli::Forecast:0x0000000002700448
#   @current_temp=3.08,
#   @date="2019-12-24",
#   @humidity=83,
#   @max_temp=5.62,
#   @min_temp=-0.09000000000000001,
#   @name="Boston",
#   @weather_state_name="Heavy Cloud",
#   @wind_speed=5.303282828282828>]
  
  #method used to start the program
  def call 
    #@@sample_data.each {|arr|  WeatherCli::Forecast.new(arr[5], arr[1] ,arr[6], arr[0], arr[3], arr[4], arr[7], arr[2])}
   puts "---------------------------------------"
   puts " Hello, Welcome to the City Weather App "
   puts "---------------------------------------"
   #binding.pry
   start
  end
  
  
  def start
    input = ""
    while input !="exit"
    puts "Type in a city to get its 6 day forecast:"
    input = gets.strip
    
    if input  == "exit"
        puts "Goodbye"
      else
        forecast_array = WeatherCli::Forecast.find_or_create_by_city_name(input)
        check_response
        print_weather_list(forecast_array)
        more_info(forecast_array)
        puts "Would you like to search for another city? "
        input = gets.strip.downcase
        if input == "exit"
          puts "Goodbye!"
        elsif input == 'y' || input == "yes"
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
        #binding.pry
        day = forecast_array[input.to_i-1]
        # pass in WHOLE object FROM LIST
        # day = WeatherCli::Forecast.find_object(OBJECT)
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

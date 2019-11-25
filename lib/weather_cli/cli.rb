
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
   location 
   get_weather(name)
   get_date
   get_weather_state
  end
  

  
  
  def get_weather(name)
    puts "Where would you like to see the forecast?"
    name = gets
    WeatherCli::API.get_woeid(name)
  end
  
  def get_date 
  WeatherCli::Forecast.all.each do |weather|
    puts weather.date
   end
  end
  
  def get_weather_state
    WeatherCli::Forecast.all.each do |weather|
      puts weather.weather_state_name
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
   puts  "See you next time for more weather updates, Goodbye!"
  end
end
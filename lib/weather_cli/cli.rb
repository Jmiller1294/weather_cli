
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
   location 
   get_weather(name)
   #get_date
   #get_weather_state
   goodbye
  end
  

  
  
  def get_weather(name)
    puts "Type in a city to get its 5 day forecast"
    name = gets
    WeatherCli::API.get_woeid(name)
    WeatherCli::Forecast.all.each do |weather|
    puts "\n The weather for #{name} on #{weather.date} is #{weather.weather_state_name}"
   end
  end
  
  # def get_date
  # WeatherCli::Forecast.all.each do |weather|
  #   puts "The weather for #{weather.date} is"
  #   puts weather.weather_state_name
  # end
  # end
  
  def get_weather_state
    #WeatherCli::Forecast.all.each do |weather|
      #puts weather.weather_state_name
    #end
   
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
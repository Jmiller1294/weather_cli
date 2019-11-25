
  class WeatherCli::CLI
  
  attr_accessor :name
  
  
  def call 
   location 
   get_weather(name)
  end
  

  
  
  def get_weather(name)
    puts "Where would you like to see the forecast?"
    name = gets
   puts WeatherCli::API.get_woeid(name)
   
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
  end
  
  def goodbye
   puts  "See you next time for more weather updates, Goodbye!"
  end
end
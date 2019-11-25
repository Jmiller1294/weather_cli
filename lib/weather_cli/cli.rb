
  class WeatherCli::CLI
  
  def call 
   location 
   puts WeatherCli::API.get_woeid("New York")
  end
  
  def location
    
    input = nil 
    
    puts "Would you like to know the weather?"
    input = gets
      if input == 'y'|| input == 'Y'|| input == "yes"|| input == "Yes"
        while input != "exit"
            puts "Enter the location of where you would like to know the weather"
            input = gets.strip
          case input
            when "New York"
              puts "78 degrees"
            when "Chicago"
              puts "53 degrees"
          end
        end
      else
    goodbye
   end
  end
  
  def goodbye
   puts  "See you next time for more weather updates, Goodbye!"
  end
end
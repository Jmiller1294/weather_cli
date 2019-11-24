
  class WeatherCli::CLI
  
  def call 
   puts "Would you like to know the weather?"
    location
  end
  
  def location
    
    input = nil 
    
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
  end
  
  def goodbye
   puts  "See you next time for more weather updates, Goodbye!"
  end
end
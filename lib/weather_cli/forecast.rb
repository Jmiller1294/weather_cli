class WeatherCli::Forecast

  
  require 'pry'
  #creates setter and getter methods
  attr_accessor :id, :date, :weather_state_name ,:current_temp , :min_temp, :max_temp,:wind_speed, :humidity 
  
  @@all = []
  
  #instantiates each object with the following attributes
  def initialize(date ,weather_state_name, current_temp, min_temp, max_temp, wind_speed, humidity)
    @date = date
    @weather_state_name = weather_state_name
    @current_temp = current_temp
    @min_temp = min_temp
    @max_temp = max_temp
    @wind_speed = wind_speed
    @humidity = humidity
    @@all << self
  end
  
  #Stores all instances of class
  def self.all
    @@all
  end
  
end

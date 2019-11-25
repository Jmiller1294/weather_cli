class WeatherCli::Forecast

  
  require 'pry'
  attr_accessor :id, :date, :weather_state_name ,:current_temp , :min_temp, :max_temp,:wind_speed, :humidity 
  
  @@all = []
  
  def initialize(weather_state_name,date)
    @weather_state_name = weather_state_name
    @date = date
    @@all << self
  end
  
  def self.all
    @@all
  end
  
 
end

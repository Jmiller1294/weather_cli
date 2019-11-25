class WeatherCli::Forecast

  
  require 'pry'
  attr_accessor :id, :date, :weather_state_name ,:current_temp , :min_temp, :max_temp,:wind_speed, :humidity 
  
  @@all = []
  
  def initialize(args ={})
    @date = date
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.type
    puts "hi"
  end
end

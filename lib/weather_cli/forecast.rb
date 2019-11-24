module WeatherCli
class Forecast
  
  require 'pry'
  attr_accessor :date
  
  @@all = []
  
  def initialize
   
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  binding.pry
end

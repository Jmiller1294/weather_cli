class WeatherCli::Forecast

  
  require 'pry'
  attr_accessor :date, :type
  
  @@all = []
  
  def initialize
    
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.type
    puts "hi"
  end
end

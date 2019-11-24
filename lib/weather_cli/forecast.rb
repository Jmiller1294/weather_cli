class WeatherCli::CLI

  
  require 'pry'
  attr_accessor :date
  
  @@all = []
  
  def initialize
   
    @@all << self
  end
  
  def self.all
    @@all
  end
  
end

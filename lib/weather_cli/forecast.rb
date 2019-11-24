class WeatherCli::Forecast
  
  attr_accessor :date
  
  @@all = []
  
  def initialize
   
    @@all << self
  end
  
  def self.all
    @@all
  end
end

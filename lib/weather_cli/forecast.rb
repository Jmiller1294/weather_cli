class WeatherCli::Forecast

  
  #creates setter and getter methods
  attr_accessor :id, :name , :date, :weather_state_name ,:current_temp , :min_temp, :max_temp, :wind_speed, :humidity 
  
  @@all = []
 
  
  def initialize(name, date ,weather_state_name, current_temp, max_temp, min_temp, wind_speed, humidity)
    @name = name
    @date = date
    @weather_state_name = weather_state_name
    @current_temp = current_temp
    @max_temp = max_temp
    @min_temp = min_temp
    @wind_speed = wind_speed
    @humidity = humidity
    @@all << self
  end
  
  
  def self.all
    @@all
  end


  def self.find_by_city_name(name)
    @@all.select do |weather|
      if weather.name.downcase == name.downcase
        weather
      end
    end
  end
  
  
  def self.find_or_create_by_city_name(user_input)
    array = self.find_by_city_name(user_input)
    if array.empty?
    WeatherCli::API.get_woeid(user_input)
    self.all.last(6)
    else
      array
    end
  end
  
end

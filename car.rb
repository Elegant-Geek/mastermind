# Create a class called MyCar. 
# When you initialize a new instance or object of the class, allow the user to define 
# some instance variables that tell us the year, color, and model of the car. 
# Create an instance variable that is set to 0 during instantiation of the object to track 
# the current speed of the car as well. 
# Create instance methods that allow the car to speed up, brake, and shut the car off.

module PrintThis
  def print_info(input)
    puts "this module is mixed in in order to print out #{input}"
  end
  def can_tow?(pounds)
    pounds < 2000
  end
end
#the big class
class Vehicle
  # syntax is wrong. JS uses const but ruby doesnt
  # const PARKING_KEY = "you found the key"
  attr_accessor :color
  attr_reader :year, :model, :speed, :gallons
  def initialize(year, color, model)
    puts "year color model initialized!"
    @year = year
    @color = color
    @model = model
    @speed = 0
  end

  def speed_up
    @speed += 15
    puts "the #{@model}'s speed is now #{@speed} mph"
  end
  def brake
    if @speed >=15
    @speed -= 15
    else
      @speed = 0
    end
    puts "the speed is now #{@speed} mph"
  end
  def off
    @speed = 0
    puts "the car is parked now"
  end
  def change_color(new_color)
    # the @ does the same as self.color here, but the self.color should be avoided imo
    @color = new_color
    # self.color = new_color
    puts "the #{model}'s color is now #{@color}."
  end

  def self.gas_mileage(miles, gallons)
    puts "#{miles / (gallons.to_i)} miles per gallon of gas"
  end
end
#the little subclass
class MyCar < Vehicle
  # the only diff between vehicle and mycar class is the adding of a constant to the mycar class. everything else is inherited from the vehicle class
  PARKING_KEY = "you found the key"
  include PrintThis
end


kia = MyCar.new("2021", "grey", "Kia")
kia.speed_up
kia.speed_up
kia.speed_up

kia.brake
kia.off

puts kia.model

kia.change_color("ORANGE")
puts kia.color

kia.color = "red"
puts kia.color


puts kia.speed

MyCar.gas_mileage(100, 5)


honda = Vehicle.new("1999", "red", "Honda")
# puts honda.PARKING_KEY
puts MyCar::PARKING_KEY
# note that the line below creates an error because the constant is not uncluded in vehicle, only in the mycar class
# puts Vehicle::PARKING_KEY
kia.print_info(MyCar::PARKING_KEY)
puts kia.can_tow?(1000)

# the commented lines below will result in error because honda is a vehicle but doesnt inherit the module called PrintThis
# honda.print_info(MyCar::PARKING_KEY)
# puts honda.can_tow?(1000)

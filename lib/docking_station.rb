require_relative 'bike'

class DockingStation
  attr_reader :bikes, :bike
  DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

  def release_bike
    fail 'there are no bikes' if empty?
    @bikes.pop
  end
  
  def dock(bike)
    fail 'dock is full' if full?
    @bikes.push(bike)
  end

  private 

  def full? 
    @bikes.length >= DEFAULT_CAPACITY
  end

  def empty?
    @bikes.empty?
  end

end



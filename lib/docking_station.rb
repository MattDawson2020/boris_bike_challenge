require_relative 'bike'

class DockingStation
  attr_reader :capacity, :bike, :bikes 

  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @bikes = []
    @capacity = capacity 
  end

  def release_bike
    fail 'there are no bikes' if empty?
    fail 'Bike broken' if !@bikes[-1].working?
    @bikes.pop
  end
  
  def dock(bike)
    fail 'dock is full' if full?
    @bikes.push(bike)
  end

  private 

  def full? 
    @bikes.length >= @capacity
  end

  def empty?
    @bikes.empty?
  end

end



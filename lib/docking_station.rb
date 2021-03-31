require_relative 'bike'

class DockingStation
  def release_bike
    @bike = Bike.new
    @bike.working?
  end
end

# newBike = DockingStation.new
# newBike.release_bike

"Hi phil"


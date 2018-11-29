require_relative 'bike'

class DockingStation

attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock_bike(bike)
     fail 'Station full' if @bikes.length >= 20
     @bikes << bike
     return bike
  end

  def release_bike
    raise 'No bikes available' unless @bikes.length != 0
    @bikes.first
  end
end

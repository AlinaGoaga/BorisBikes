require_relative 'bike'

class DockingStation

attr_reader :bike

  def initialize
    @bikes = []
  end

  def dock_bike(bike)
     fail 'Station full' if full?
     @bikes << bike
  end

  def release_bike
    raise 'No bikes available' unless empty? == false
    @bikes.first
  end
end

private

def full?
   @bikes.length >= 20
 end

 def empty?
   @bikes.empty?
 end

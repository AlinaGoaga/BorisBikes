require_relative 'bike'

class DockingStation
  DEFAULT_CAPACITY = 20

  attr_reader :bikes, :capacity

  def initialize(capacity = DEFAULT_CAPACITY)
    @capacity = capacity
    @bikes = []
  end

  def dock_bike(bike)
    raise 'Station full' if full?
    @bikes << bike
  end

  def release_bike
    raise 'No working bikes available' if working_bikes.empty?
    working_bikes.first
  end

  private

  def full?
    @bikes.count >= capacity
   end

  def working_bikes
    @bikes.reject(&:broken?)
  end
end

require_relative 'bike'

class DockingStation

attr_reader :bike

  def dock_bike(bike)
     @bike = bike   # @bike would be the docked bike
  end

  # def bike
  #   @bike
  # end

  def release_bike
    fail 'No bikes available' unless @bike
    @bike
  end
end

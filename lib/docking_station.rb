class DockingStation
  attr_reader :bike, :bike_space

  def initialize
    super
    @bike_space = [ ]
  end

  def release_bike
    ## raise an error if someone wants to RENT a bike because there isn't one in the space
#    if @bike_space.count == 0
#      raise "No bikes available"
#    else
#      Bike.new
#    end
      if @bike_space.count == 0
        raise "No bikes available"
      else
      Bike.new
    end
  end

  def dock(bike)
    ## raise an error if someone wants to DOCK a bike because there's no room
    if @bike_space.count == 1
      raise "There's a bike here, so you can't dock, sorry"
    else
      @bike = bike
    end
  end
end

class DockingStation
  attr_reader :bikes, :capacity

  def initialize
    super
    @capacity = [ ]
    @bikes      = [ ]
  end

  def release_bike
    ## raise an error if someone wants to RENT a bike because there isn't one in the space
#    if @capacity.count == 0
#      raise "No bikes available"
#    else
#      Bike.new
#    end
      if @capacity.count == 0
        raise "No bikes available"
      else
      @bikes.pop
    end
  end

  def dock(bike)
    ## raise an error if someone wants to DOCK a bike because there's no room
    if @capacity.count == 20
      raise "There's a bike here, so you can't dock, sorry"
    else
      @bikes.push(bike)
    end
  end
end

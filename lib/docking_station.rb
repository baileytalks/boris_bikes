class DockingStation
  attr_reader :bike, :capacity

  def release_bike
    Bike.new
  end

  def dock(bike)
    @bike = bike
  end

  def capacity
    @capacity = []
    if @capacity.count == 0
      raise "No bikes available"
    end
  end
end

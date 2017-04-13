class DockingStation
  attr_reader :bikes, :capacity

  def initialize(n=20)
    @bikes = [ ]
    @capacity = n
  end

  def capacity
    @capacity
  end

  def release_bike
    @bikes.pop if empty?; display_error
  end

  def dock(bike)
    if full?; display_error
    else
      @bikes.push(bike)
    end
  end

  private
    def full?
      @bikes.count >= @capacity
    end

    def empty?
      @bikes.empty?
    end

    def display_error
      if full?
        raise "There's a bike here, so you can't dock, sorry"
      elsif empty?
        raise "No bikes available"
      end
    end
end

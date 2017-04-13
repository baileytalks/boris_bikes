class DockingStation
  attr_reader :bikes
  DEFAULT_CAPABILITY = 20

  def initialize
    @bikes = [ ]
  end

  def release_bike
    ## raise an error if someone wants to RENT a bike because there isn't one in the space
    @bikes.pop if empty?; error
  end

  def dock(bike)
    ## raise an error if someone wants to DOCK a bike because there's no room
    if full?; error
    else
      @bikes.push(bike)
    end
  end

  private
    def full?
      @bikes.count >= DEFAULT_CAPABILITY
    end

    def empty?
      @bikes.empty?
    end

  def error
    if full?
      raise "There's a bike here, so you can't dock, sorry"
    elsif empty?
      raise "No bikes available"
    end
  end

end

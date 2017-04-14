require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(n=DEFAULT_CAPACITY)
    @bikes = [ ]
    @capacity = n
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
        raise "This station is full, so you can't dock, sorry"
      elsif empty?
        raise "No bikes available"
      end
    end
end

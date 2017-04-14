require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(n=DEFAULT_CAPACITY)
    @bikes = [ ]
    @capacity = n
  end

  def release_bike
    if empty?
       display_error
    else
      ## iterate over the bikes in the array and only return a working bike
      released_bike = ''
      @bikes.each_with_index do | bike, i |
        if @bikes[i].working == false
          i = i + 1
        else
          released_bike = @bikes.delete_at(i)
        end
      end
      ## If the docking_station only has broken bikes, it should return an error
        if released_bike == ''
          display_error
        else
          released_bike
        end
    end
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

    def first_bike_working?
      @bikes.first.working
    end

    def display_error
      if full?
        raise "This station is full, so you can't dock, sorry"
      else
        raise "No bikes available"
      end
    end


end

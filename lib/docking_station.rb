require_relative 'bike'

class DockingStation
  attr_reader :bikes, :capacity
  DEFAULT_CAPACITY = 20

  def initialize(n=DEFAULT_CAPACITY)
    @bikes = [ ]
    @capacity = n
  end

  def release_bike
    # display_error if empty?
    # display_error if first_bike_working? == false
    # @bikes.shift

    if empty?
       display_error
    else
    ## iteration below
      released_bike = ''
      @bikes.each_with_index do | bike, i |
        if @bikes[i].working == false
          i = i + 1
        else
          released_bike = @bikes.delete_at(i)
        end
      end

      # if @bikes[-1].instance_variable_get(:@working) == false
      #     raise "No bikes available"
      # end

        # if @bikes.last.instance_variable_get(:@working) == false
        #   p @bikes.last.instance_variable_get(:@working)
        #   raise "No bikes available"
        # else
        #
        # end

      released_bike
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
      elsif empty? || first_bike_working? == false
        raise "No bikes available"
      end
    end


end

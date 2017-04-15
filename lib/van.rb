class Van
  attr_reader :bikes

  def initialize
    @bikes = [ ]
  end

  def deliver(garage)
    if @bikes.count == 0
      raise "No bikes to deliver"
    else
      @bikes.each { |bike| garage.bikes.push bike }
      @bikes = []
      # garage.bikes.push(@bikes[0])
      # @bikes.delete_at(0)
      # garage.bikes.push(@bikes[1])
      # @bikes.delete_at(1)
    end
      # garage.bikes.push(@bikes)
      # @bikes = []
  end

  def collect
  end

  def distribute
  end

end

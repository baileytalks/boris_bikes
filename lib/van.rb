class Van
  attr_reader :bikes

  def initialize
    @bikes = [ ]
  end

  def deliver(garage)
    if @bikes.count == 0
      raise_error "No bikes to deliver"
    else
      garage.bikes.concat(@bikes)
      @bikes = []
    end
  end

end

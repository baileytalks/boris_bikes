require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

#  it 'releases working bikes' do
#    bike = subject.release_bike
#    expect(bike.working?).to(eq(true))
#  end

  ## it 'allows a new DockingStation instance to receive a bike' do
  ##  is_expected.to respond_to :dock_bike
  ## end

  ## it 'docks a new bike' do
    # taking the class variable, that is a hash, and checking has instance of Bike
    #
    # this test checks that every time a new DockingStation is created, it includes
    # space for bikes (which are instance variables here), and checks that the
    # things inside the space are actually bikes (and not just pigeons or sandwiches)
    #
    # Here are two ways we tried and got stuck on:
    # expect(subject.dock_bike.instance_variable_get(:@bike)).to exist
    # is_expected.to respond_to subject.dock_bike.instance_variable_get(:@bike)

  ##  expect(subject.dock_bike).to be_an_instance_of(Bike)
  ## end

  ## it 'tests whether or not a member of the public can can see that a bike has been docked' do
    ## expect(subject.bike).to respond_to [bike]
  ## end

  ## Code from the challenge 11 walkthrough
  ## tests whether or not a dockingstation can receive a bike when it is docked'
    it { is_expected.to respond_to(:dock).with(1).argument}

    it { is_expected.to respond_to(:bikes) }

    it 'tests whether or not a bike is docked' do
      bike = Bike.new
      expect(subject.dock(bike)).to include bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to include bike
    end

    it 'produces an error if docking station has no bikes' do
      subject.instance_variable_set(:@bikes, [])
      expect {subject.release_bike}.to raise_error 'No bikes available'
    end

    it 'produces an error if docking station is full' do
      bike = Bike.new
      #subject.instance_variable_set(:@, ['1', '2', '3', '4', '5', '6', '7', '8', '9',
      #                                             '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20'])
      # 20.times { subject.bikes.push(Bike.new) }
      DockingStation::DEFAULT_CAPABILITY.times do
        subject.dock Bike.new
      end
      expect {subject.dock(bike)}.to raise_error "There's a bike here, so you can't dock, sorry"
    end

end

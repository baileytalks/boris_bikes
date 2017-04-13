require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

  it 'releases working bikes' do
    bike = subject.release_bike
    expect(bike.working?).to(eq(true))
  end

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

    it { is_expected.to respond_to(:bike) }

    it 'tests whether or not a bike is docked' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'returns docked bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq bike
    end

    it 'produces an error if docking station has no capacity' do
      expect {subject.capacity.count == 0}.to raise_error
    end

end

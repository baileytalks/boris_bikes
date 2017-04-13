require 'docking_station'
require 'bike'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }

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
    subject.instance_variable_get(:@capacity).times do
      subject.dock Bike.new
    end
    expect {subject.dock(bike)}.to raise_error "There's a bike here, so you can't dock, sorry"
  end

  it 'takes an argument when creating a new DockingStation instance for the capacity' do
    expect(subject.capacity).to eq 20
  end

end

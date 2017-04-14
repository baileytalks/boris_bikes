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
  # subject.instance_variable_set(:@bikes, [])
    expect {subject.release_bike}.to raise_error "No bikes available"
  end

  it 'produces an error if docking station is full' do
    bike = Bike.new
    # subject.instance_variable_get(:@capacity).times do
      subject.capacity.times do
      subject.dock Bike.new
    end
    expect {subject.dock(bike)}.to raise_error "This station is full, so you can't dock, sorry"
  end

  it 'expect default as 20 when creating a new DockingStation instance for the capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

  it 'expect a new DockingStation instance to take an argument to change the capacity' do
    docking_station5 = DockingStation.new(5)
    expect(docking_station5.capacity).to eq 5
  end

  describe 'initalization' do
    subject { DockingStation.new }
    let(:bike) { Bike.new }
    it 'defaults capacity' do
      DockingStation::DEFAULT_CAPACITY.times do
        subject.dock(bike)
      end
      expect { subject.dock(bike) }.to raise_error "This station is full, so you can't dock, sorry"
    end
  end

  describe '#release_bike' do
    it "should release a bike if there's one available" do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it "shouldn't release a bike if it's broken" do
      bike = Bike.new
      bike.report_broken
      subject.dock(bike)
      expect { subject.release_bike }.to raise_error "No bikes available"
    end

    it "should release a working bike if there's one at the docking station, even if the first one is broken" do
      bike = Bike.new
      broken_bike = Bike.new
      broken_bike.report_broken
      docking_station = DockingStation.new
      docking_station.dock(broken_bike)
      docking_station.dock(bike)
      expect(docking_station.release_bike).to eq bike
    end
  end
end

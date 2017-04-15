require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Van do
  it 'has capacity for bikes (a bikes attribute) when van is instantiated' do
    expect(subject.bikes).to eq []
  end

  it 'collects broken bikes from docking stations with collect_broken_bikes' do
    ## Using doubles I haven't been able to make this test work:
    # broken_bike = double("broken_bike")
    # docking_station = double("docking_station", :dock => broken_bike, :collect_broken_bikes => [])
    broken_bike = Bike.new
    broken_bike.report_broken
    docking_station = DockingStation.new
    docking_station.dock(broken_bike)
    docking_station.collect_broken_bikes(subject)
    expect(subject.bikes).to include broken_bike
  end

  describe '#deliver' do
    it { is_expected.to respond_to :deliver }

    it 'delivers broken bikes when asked to deliver, leaving no bikes in the van' do
      broken_bike = Bike.new
      broken_bike.report_broken
      docking_station = DockingStation.new
      docking_station.dock(broken_bike)
      docking_station.collect_broken_bikes(subject)
      garage = Garage.new
      subject.deliver(garage)
      expect(subject.bikes.count).to eq 0
    end

    it 'delivers broken bikes to the garage when asked to deliver' do
      broken_bike = Bike.new
      broken_bike.report_broken
      docking_station = DockingStation.new
      docking_station.dock(broken_bike)
      docking_station.collect_broken_bikes(subject)
      garage = Garage.new
      subject.deliver(garage)
      expect(garage.bikes).to include broken_bike
    end

    it 'raises an error if an empty van is asked to deliver' do
      garage = Garage.new
      expect{subject.deliver(garage)}.to raise_error "No bikes to deliver"
    end

  end

end

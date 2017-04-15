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

end

require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do
  it 'has capacity for bikes (a bikes attribute) when garage is instantiated' do
    expect(subject.bikes).to eq []
  end

  # describe '#fix_bikes' do
  #   it 'fixes bikes so that the first bike in the array is now fixed' do
  #     broken_bike = Bike.new
  #     broken_bike.report_broken
  #     docking_station = DockingStation.new
  #     van = Van.new
  #     docking_station.dock(broken_bike)
  #     docking_station.collect_broken_bikes(van)
  #     van.deliver(subject)
  #     subject.fix_bikes
  #     expect(subject.bikes[0].working).to eq true
  #   end

  #   it 'fixes bikes so that every bike in the array is now fixed' do
  #     broken_bike = Bike.new
  #     broken_bike2 = Bike.new
  #     broken_bike.report_broken
  #     broken_bike2.report_broken
  #     docking_station = DockingStation.new
  #     van = Van.new
  #     docking_station.dock(broken_bike)
  #     docking_station.dock(broken_bike2)
  #     docking_station.collect_broken_bikes(van)
  #     van.deliver(subject)
  #     p subject
  #     subject.fix_bikes
  #     expect(subject.bikes[1].working).to eq true
  #   end
  # end

end

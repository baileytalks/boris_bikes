require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do
  it 'has capacity for bikes (a bikes attribute) when garage is instantiated' do
    expect(subject.bikes).to eq []
  end
end

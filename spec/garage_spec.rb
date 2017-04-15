require 'docking_station'
require 'bike'
require 'van'
require 'garage'

describe Garage do
  it { is_expected.to respond_to :van_delivery }

  it 'has capacity for bikes (a bikes attribute) when garage is instantiated' do
    expect(subject.bikes).to eq []
  end
end

require 'bike'

describe Bike do
  ## Tests if bikes can be reported broken
  it { is_expected.to respond_to :report_broken }

  ## Tests if bikes have are always marked as working or not working
  it 'has a working attribute when bike is instantiated' do
    expect(subject.working).to eq true
  end

  ## Tests if bikes are marked not working when reported broken
  it 'should set working to false when report_broken is called' do
    broken_bike = Bike.new
    expect(broken_bike.report_broken).to eq false
  end
end

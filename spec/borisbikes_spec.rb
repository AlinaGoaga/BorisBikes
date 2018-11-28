require 'borrisbikes'

#describe DockingStation do
#  it 'responds to release_bike' do
#    expect(docking_station).to respond_to :release_bike
#  end
#end

describe DockingStation do
  it { is_expected.to respond_to :release_bike }

  it 'gets a working bike' do
    bike = DockingStation.new.release_bike
    expect(bike.working?).to be true
  end

end

require 'station'

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

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'docks the bike into the station' do
    station = DockingStation.new
    bike = Bike.new
    expect(station.dock_bike(bike)).to eq bike
  end

  it { is_expected.to respond_to :bike }

end

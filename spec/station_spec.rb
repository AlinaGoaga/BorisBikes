require 'station'

RSpec.describe DockingStation do
  before(:each) do
    @station = DockingStation.new
  end

  it { is_expected.to respond_to :release_bike }

  it 'gets a working bike' do
    bike = @station.release_bike
    expect(bike.working?).to be true
  end

  it { is_expected.to respond_to(:dock_bike).with(1).argument }

  it 'returns docked bike' do
    bike = Bike.new
    expect(@station.dock_bike(bike)).to eq bike
  end

  it { is_expected.to respond_to :bike } # testing reader

  describe '#release_bike' do
     it 'releases a bike' do
        bike = Bike.new
        @station.dock_bike(bike) # docking the bike in the station
        expect(@station.release_bike).to eq bike
      end
    end

describe '#release_bike' do
     it 'raises an error when there are no bikes available' do
       expect { @station.release_bike }.to raise_error 'No bikes available'
     end
   end

  end

require 'station'

RSpec.describe 'Docking Station' do
  let(:docking_station) { DockingStation.new }
  let(:bike) { Bike.new }

  # As a person,
  # So that I can use a bike,
  # I'd like a docking station to release a bike.

  # As a maintainer of the system,
  # So that I can manage broken bikes and not disappoint users,
  # I'd like docking stations not to release broken bikes.

  context 'releasing a bike' do
    it 'bike is released if not broken' do
      docking_station.dock_bike(bike)
      expect(docking_station.release_bike).to eq bike
    end

    it 'bike is not released if broken' do
      bike.report_broken
      docking_station.dock_bike(bike)
      expect { docking_station.release_bike }.to raise_error 'No working bikes available'
    end
  end

  # As a member of the public
  # So I can return bikes I've hired
  # I want to dock my bike at the docking station

  # As a member of the public,
  # So that I reduce the chance of getting a broken bike in future,
  # I'd like to report a bike as broken when I return it.

  # As a maintainer of the system,
  # So that I can control the distribution of bikes,
  # I'd like docking stations not to accept more bikes than their capacity.

  context 'docking a bike' do
    it 'allows the docking if capacity has not been reached' do
      expect(docking_station.dock_bike(bike)).to eq [bike]
    end

    it 'gives the user the chance to report a broken bike when docking it' do
      bike.report_broken
      docking_station.dock_bike(bike)
      expect(bike.broken?).to eq true
    end

    it 'prevents the docking of further bikes if capacity is reached' do
      docking_station = DockingStation.new(30)
      30.times { docking_station.dock_bike(bike) }
      expect { docking_station.dock_bike(bike) }.to raise_error 'Station full'
    end
  end

  # As a system maintainer,
  # So that I can plan the distribution of bikes,
  # I want a docking station to have a default capacity of 20 bikes.

  # As a system maintainer,
  # So that busy areas can be served more effectively,
  # I want to be able to specify a larger capacity when necessary.

  describe 'capacity' do
    it 'docking stations have a default capacity' do
      DockingStation::DEFAULT_CAPACITY.times { docking_station.dock_bike(bike) }
      expect { docking_station.dock_bike(bike) }.to raise_error 'Station full'
    end

    it 'the docking station capacity can be updated as needed' do
      docking_station = DockingStation.new(30)
      expect { 30.times { docking_station.dock_bike(bike) } }.not_to raise_error
    end
  end
end

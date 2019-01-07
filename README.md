Boris Bikes
===========

To run the application:
-clone the repository
-cd into project folder
-run bundle
-start irb and require './lib/station.rb'

Tests
-used rspec to write feature and unit tests
-classes being test in isolation with the help of doubles
-to run tests simply run rspec in the main project folder
   
   ```
   As a person,
   So that I can use a bike,
   I'd like a docking station to release a bike.
   ```
   
   ```
   As a maintainer of the system,
   So that I can manage broken bikes and not disappoint users,
   I'd like docking stations not to release broken bikes.
   ```
   
   ```
   As a member of the public
   So I can return bikes I've hired
   I want to dock my bike at the docking station
   ```
   
   ```
   As a member of the public,
   So that I reduce the chance of getting a broken bike in future,
   I'd like to report a bike as broken when I return it.
   ```
   
   ```
   As a maintainer of the system,
   So that I can control the distribution of bikes,
   I'd like docking stations not to accept more bikes than their capacity.
   ```
   
   ```
   As a system maintainer,
   So that I can plan the distribution of bikes,
   I want a docking station to have a default capacity of 20 bikes.
   ```
   
   ```
   As a system maintainer,
   So that busy areas can be served more effectively,
   I want to be able to specify a larger capacity when necessary.
   ```

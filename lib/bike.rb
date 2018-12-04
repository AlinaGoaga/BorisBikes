class Bike
  def working?
    true
  end

  def report_broken
    @broken = true
end

  def broken?
    @broken
  end
end

# 2.5.1 :001 > require './lib/bike.rb'
#  => true
# 2.5.1 :002 > bike = Bike.new
#  => #<Bike:0x00007fd1c388d050>
# 2.5.1 :003 > bike.working?
#  => true
# 2.5.1 :004 > bike
#  => #<Bike:0x00007fd1c388d050>
# 2.5.1 :005 > bike.report_broken
#  => true
# 2.5.1 :006 > bike
#  => #<Bike:0x00007fd1c388d050 @broken=true>
# 2.5.1 :007 > bike.broken?
#  => true
# 2.5.1 :008 >

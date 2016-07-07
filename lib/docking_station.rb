require_relative 'bike'

class DockingStation
DEFAULT_CAPACITY = 20

  def initialize
    @bikes = []
  end

   def release_bike
     fail "No bikes available" if @bikes.empty?
     @bikes.pop
   end

   def dock(bike)
     fail "Docking station full" if full?
    @bikes << bike
   end

   attr_reader :bikes

   private

   def full?
     @bikes.length >= DEFAULT_CAPACITY
   end
end

require 'docking_station'

describe DockingStation do
=begin
  it 'releases working bike' do
    bike = subject.release_bike
    expect(bike).to be_working
  end
=end
  describe '#release_bike' do
    it 'releases a bike' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end
  end

   describe '#dock' do

     it 'raises an error when full' do
       DockingStation::DEFAULT_CAPACITY.times { subject.dock(Bike.new) }
       expect { subject.dock Bike.new }.to raise_error("Docking station full")
     end

   end


=begin
    it {is_expected.to respond_to :bikes}

    it 'list bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq bike
    end


    it {is_expected.to respond_to(:dock).with(1).argument}

    it 'docks something' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
     end

=end
end

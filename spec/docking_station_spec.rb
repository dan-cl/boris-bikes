require 'docking_station'

describe DockingStation do


  it 'has a default capacity' do
    expect(subject.capacity).to eq described_class::DEFAULT_CAPACITY
  end

  it {is_expected.to respond_to(:dock).with(1).argument}

  it {is_expected.to respond_to :bikes}

  it {is_expected.to respond_to :release_bike}

  describe '#initialize' do

  subject { DockingStation.new}
  let(:bike) {Bike.new}

   it 'has a variable capacity' do
     docking_station = DockingStation.new(50)
     50.times {docking_station.dock bike}
     expect {docking_station.dock bike}.to raise_error 'Docking station full'
   end

  it 'defaults capacity' do
    described_class::DEFAULT_CAPACITY.times do
      subject.dock(bike)
    end
    expect{ subject.dock(bike)}.to raise_error 'Docking station full'
  end



  end

  describe '#release_bike' do
    let(:bike) { Bike.new }
    it 'releases a bike' do
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    it 'raises an error when there are no bikes available' do
      expect { subject.release_bike }.to raise_error("No bikes available")
    end

    it 'will not release broken bike' do
      bike.broken
      subject.dock(bike)
      expect{subject.release_bike}.to raise_error ('Bike is broken')
    end

  end

   describe '#dock' do

     it 'docks something' do
       bike = Bike.new
       expect(subject.dock(bike)).to eq [bike]
      end

     it 'raises an error when full' do
       subject.capacity.times {subject.dock(Bike.new)}
       expect { subject.dock Bike.new }.to raise_error("Docking station full")
     end


   end



    it 'list bikes' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bikes).to eq [bike]
    end

end

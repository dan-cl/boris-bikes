require 'bike'

describe Bike do
  it { is_expected.to respond_to :working? }
  it { is_expected.to respond_to :broken }

  describe '#working?' do
    let(:bike) {Bike.new}
    it 'confirms bike is working' do
      expect(bike.working?).to be true
    end
    it 'confirms when bike is broken' do
      expect((bike.broken).working?).to be false
    end
  end


  describe '#broken' do
    let(:bike) {Bike.new}
    it 'flags bike as broken' do
      bike.broken

      end
    end

end

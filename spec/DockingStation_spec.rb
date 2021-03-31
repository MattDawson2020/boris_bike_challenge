require "docking_station.rb"

describe DockingStation do

  describe '#release_bikes' do
    it "It responds to release bike" do
      expect(subject).to respond_to(:release_bike)
    end
  
    it "Releases the bike" do
      bike = Bike.new 
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end
  end
  
  describe '#dock_bikes' do
    it 'responds to dock' do
      @bike = Bike.new
      expect(subject).to respond_to(:dock)
    end
  
    it 'responds to dock with arguments' do
      @bike = Bike.new
      expect(subject).to respond_to(:dock).with(1).arguments
    end

    it { is_expected.to respond_to(:bike) }

    it 'docks a bike and returns it' do
      bike = Bike.new
      subject.dock(bike)
      expect(subject.bike).to eq(bike)
    end
  end

  it 'raise an error docking station is empty' do
    #docking_station = DockingStation.new
    expect { subject.release_bike }.to raise_error 'there are no bikes'
  end
end

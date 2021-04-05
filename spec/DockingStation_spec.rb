require "docking_station.rb"

describe DockingStation do
  let(:bike) { double :bike }

  describe '#release_bikes' do
    before do 
      subject.dock(bike)
      allow(bike).to receive(:working?).and_return(true)
    end

    it "It responds to release bike" do
      expect(subject).to respond_to(:release_bike)
    end

    it "Releases the bike" do
      expect(subject.release_bike).to eq(bike)
    end

    it "does not release a broken bike" do
      allow(bike).to receive(:report_broken).and_return(false)
      allow(bike).to receive(:working?).and_return(false)
      expect { subject.release_bike }.to raise_error 'Bike broken'
    end
    
  end
  
  describe '#dock_bikes' do
    it 'responds to dock' do
      expect(subject).to respond_to(:dock)
    end
  
    it 'responds to dock with arguments' do
      expect(subject).to respond_to(:dock).with(1).arguments
    end

    it { is_expected.to respond_to(:bike) }

    it 'docks a bike and returns it' do
      subject.dock(bike)
      expect(subject.bikes[-1]).to eq(bike)
    end

  end

  it 'raise an error docking station is empty' do
    expect { subject.release_bike }.to raise_error 'there are no bikes'
  end

  it 'raises an error when docking station is full' do
    subject.capacity.times { subject.dock(Bike.new) }
    expect {subject.dock(Bike.new)}.to raise_error 'dock is full'
  end

  it 'lets operators set a capacity' do
    docking_station = DockingStation.new(5)
    expect(docking_station.capacity).to eq(5)
  end

  it 'has a default capacity' do
    expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
  end

end




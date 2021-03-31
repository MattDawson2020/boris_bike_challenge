require "docking_station.rb"

describe DockingStation do
  it "It responds to release bike" do
    expect(subject).to respond_to(:release_bike)
  end
  it "Releases the bike" do
    expect(subject.release_bike).to eq(true)
  end
end
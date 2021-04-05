require 'bike.rb'

describe Bike do

  it 'responds to working?' do
    expect(subject).to respond_to(:working?)
  end

  it 'responds to report_broken' do
    expect(subject).to respond_to(:report_broken)
  end  

  it 'allows a user to report a bike as broken' do
    subject.report_broken
    expect(subject.working?).to be false 
  end

end
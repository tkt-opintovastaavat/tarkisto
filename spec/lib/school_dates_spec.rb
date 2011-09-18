require 'spec_helper'

describe SchoolDates do

  describe "#semester" do

    before(:each) do
      @fakedate = "lol"
      Date.should_receive(:today).and_return(@fakedate)
    end

    it "should return spring" do
      [1..5].each do |month|
        @fakedate.should_receive(:month).and_return(month)
        SchoolDates.semester.should == 'K'
      end
    end

    it "should return summer" do
      [6..8].each do |month|
        @fakedate.should_receive(:month).and_return(month)
        SchoolDates.semester.should == 'V'
      end
    end

    it "should return autumn" do
      [9..12].each do |month|
        @fakedate.should_receive(:month).and_return(month)
        SchoolDates.semester.should == 'S'
      end
    end

  end

end

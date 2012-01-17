require 'spec_helper'

describe Level do
  before(:each) do
    @valid_attributes = {
      :name_fi => 'Level name'
    }
    @invalid_level = Level.new
  end

  it "should create a new instance given valid attributes" do
    Level.create!(@valid_attributes)
  end

  it "should have a name" do
    @invalid_level.should have(1).error_on(:name_fi)
  end

  describe "names" do

    before(:each) do
      @level = mock_model(Level)
      Level.should_receive(:find_by_name_fi).and_return(@level)
    end

    it "should have basic studies" do
      Level.basic_studies.should == @level
    end

    it "should have intermediate studies" do
      Level.intermediate_studies.should == @level
    end

    it "should have advanced studies" do
      Level.advanced_studies.should == @level
    end

    it "should have other studies" do
      Level.other_studies.should == @level
    end

  end

end

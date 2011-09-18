require 'spec_helper'

describe Level do
  before(:each) do
    @valid_attributes = {
      :name_fi => 'Perusopinnot'
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

    it "should have basic studies" do
      Level.basic_studies.name.should == "Perusopinnot"
    end

    it "should have intermediate studies" do
      Level.intermediate_studies.name.should == "Aineopinnot"
    end

    it "should have advanced studies" do
      Level.advanced_studies.name.should == "Syventävät opinnot"
    end

    it "should have other studies" do
      Level.other_studies.name.should == "Muut opinnot"
    end

  end

end

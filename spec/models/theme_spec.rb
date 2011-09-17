require 'spec_helper'

describe Theme do
  before(:each) do
    @valid_attributes = {
      :name_fi => "Säännölliset lausekkeet"
    }
    @invalid_theme = Theme.new
  end

  it "should create a new instance given valid attributes" do
    Theme.create!(@valid_attributes)
  end
  it "should contain a name" do
    @invalid_theme.should have(1).error_on(:name_fi)
  end
end

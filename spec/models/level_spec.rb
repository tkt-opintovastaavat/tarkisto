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
end
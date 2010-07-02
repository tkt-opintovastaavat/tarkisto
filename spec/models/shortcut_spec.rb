require 'spec_helper'

describe Shortcut do
     before(:each) do
          @valid_attributes = {
               :name => 'ohpe' ,
               :course_id => 1
          }
          @invalid_shortcut = Shortcut.new
     end

     it "should create a new instance given valid attributes" do
          Shortcut.create!(@valid_attributes)
     end

     it "should contain a shortcut" do
          @invalid_shortcut.should have(1).error_on(:name)
     end

end

require 'spec_helper'

describe Instance do
     before(:each) do
          @valid_attributes = {
               :course_id => 1 ,
               :period => 1 ,
               :year => 2009 ,
               :semester => 'S'
          }
          @invalid_instance = Instance.new
     end

     it "should create a new instance given valid attributes" do
          Instance.create!(@valid_attributes)
     end

     it "should have year" do
          @invalid_instance.should have(1).error_on(:year)          
     end

     it "should have semester" do
          @invalid_instance.should have(1).error_on(:semester)          
     end
end

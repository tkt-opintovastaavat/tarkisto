require 'spec_helper'

describe Attendance do
     before(:each) do
          @valid_attributes = {
               :instance_id => 1 ,
               :user_id => 1
          }
          @invalid_attendance = Attendance.new
     end

     it "should create a new instance given valid attributes" do
          Attendance.create!(@valid_attributes)
     end
end

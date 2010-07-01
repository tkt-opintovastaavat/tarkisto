require 'spec_helper'

describe Lecturer do
     before(:each) do
          @valid_attributes = {
               :name => 'Arto Wikla' ,
               :active => true
          }
          @invalid_lecturer = Lecturer.new
     end

     it "should create a new instance given valid attributes" do
          Lecturer.create!(@valid_attributes)
     end

     it "should have name" do
          @invalid_lecturer.should have(1).error_on(:name)          
     end
end

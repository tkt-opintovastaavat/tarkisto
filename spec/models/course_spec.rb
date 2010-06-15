require 'spec_helper'

describe Course do
     before(:each) do
          @valid_attributes = {
               :code => 12345 ,
               :name => 'Ohjelmoinnin perusteet' ,
               :course_level_id => 1 ,
               :credits => 5 ,
               :replaced_by_course_id => 2
          }
          @invalid_course = Course.new
     end

     it "should create a new instance given valid attributes" do
          Course.create!(@valid_attributes)
     end

     it "should have a course code" do
          @invalid_course.should have(1).error_on(:code)          
     end

     it "should have a name" do
          @invalid_course.should have(1).error_on(:name)          
     end

     it "should have credits" do
          @invalid_course.should have(1).error_on(:credits)
     end
end

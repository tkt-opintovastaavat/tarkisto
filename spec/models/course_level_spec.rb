require 'spec_helper'

describe CourseLevel do
     before(:each) do
          @valid_attributes = {
               :name => 'Perusopinnot'
          }
          @invalid_course_level = CourseLevel.new
     end

     it "should create a new instance given valid attributes" do
          CourseLevel.create!(@valid_attributes)
     end

     it "should have a name" do
          @invalid_course_level.should have(1).error_on(:name)
     end
end

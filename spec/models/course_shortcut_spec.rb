require 'spec_helper'

describe CourseShortcut do
     before(:each) do
          @valid_attributes = {
               :shortcut => 'ohpe' ,
               :course_id => 1
          }
          @invalid_course_shortcut = CourseShortcut.new
     end

     it "should create a new instance given valid attributes" do
          CourseShortcut.create!(@valid_attributes)
     end

     it "should contain a shortcut" do
          @invalid_course_shortcut.should have(1).error_on(:shortcut)
     end

end

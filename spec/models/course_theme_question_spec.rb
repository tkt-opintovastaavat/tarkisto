require 'spec_helper'

describe CourseThemeQuestion do
     before(:each) do
          @valid_attributes = {
               :course_theme_id => 1,
               :question_id => 1
          }
          @invalid_course_theme_question = CourseThemeQuestion.new
     end

     it "should create a new instance given valid attributes" do
          CourseThemeQuestion.create!(@valid_attributes)
     end

     it "should have valid reference to course theme" do
          @invalid_course_theme_question.should have(1).error_on( :course_theme_id)
     end
     it "should have valid reference to question" do
          @invalid_course_theme_question.should have(1).error_on( :question_id)
     end
end

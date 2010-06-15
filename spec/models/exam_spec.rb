require 'spec_helper'

describe Exam do
     before(:each) do
          @valid_attributes = {
               :exam_type_id => 1 ,
               :course_id => 2 ,
               :lecturer => 'Arto Wikla' ,
               :maximum_points => 60 ,
               :public => true ,
               :date => Date.today
          }
          @invalid_exam = Exam.new
     end

     it "should create a new instance given valid attributes" do
          Exam.create!(@valid_attributes)
     end

     it "should have lecturer info" do
          @invalid_exam.should have(1).error_on(:lecturer)
     end

     it "should have maximum points" do
          @invalid_exam.should have(1).error_on(:maximum_points)
     end

     it "should have a date" do
          @invalid_exam.should have(1).error_on(:date)
     end

end

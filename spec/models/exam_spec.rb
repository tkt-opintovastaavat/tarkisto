require 'spec_helper'

describe Exam do
     before(:each) do
          @valid_attributes = {
               :exam_type_id => 1 ,
               :course_id => 2 ,
               :maximum_points => 60 ,
               :public => true ,
               :date => Date.today
          }
          @valid_exam = Exam.new @valid_attributes
          @invalid_exam = Exam.new
     end

     it "should create a new instance given valid attributes" do
          Exam.create!(@valid_attributes)
     end

     it "should have maximum points" do
          @invalid_exam.should have(1).error_on(:maximum_points)
     end

     it "should have a date" do
          @invalid_exam.should have(1).error_on(:date)
     end

     it "should format name" do
          etype_mock = mock_model ExamType
          @valid_exam.stub!(:exam_type).and_return(etype_mock)
          etype_mock.stub!(:name).and_return("Erilliskoe")
          @valid_exam.name.should == "#{@valid_exam.exam_type.name} #{I18n.l @valid_exam.date, :format => :short}"
     end

end

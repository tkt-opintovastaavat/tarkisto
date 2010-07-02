require 'spec_helper'

describe Exam do
     before(:each) do
          @valid_attributes = {
               :type_id => 1 ,
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
          type_mock = mock_model Type
          @valid_exam.stub!(:type).and_return(type_mock)
          type_mock.stub!(:name).and_return("Erilliskoe")
          @valid_exam.name.should == "#{@valid_exam.type.name} #{I18n.l @valid_exam.date, :format => :short}"
     end

     it "should return only unpublished exams if asked so" do
          unpublished_exams = Exam.unpublished
          unpublished_exams.each do |exam|
               exam.published.should == false
          end
     end

     it "should return only published exams if asked so" do
          published_exams = Exam.published
          published_exams.each do |exam|
               exam.published.should == true
          end
     end

     it "should publish exam, when asked" do
          exam = Exam.create!(@valid_attributes)
          exam.published.should == false
          exam.publish!
          exam.published.should == true
     end

     it "should unpublish exam, when asked" do
          exam = Exam.create!(@valid_attributes)
          exam.published.should == false
          exam.publish!
          exam.published.should == true
          exam.unpublish!
          exam.published.should == false
     end

     it "should return only private exams if asked so" do
          private_exams = Exam.only_private
          private_exams.each do |exam|
               exam.public.should == false
          end
     end

     it "should return only public exams if asked so" do
          public_exams = Exam.only_public
          public_exams.each do |exam|
               exam.public.should == true
          end
     end

end

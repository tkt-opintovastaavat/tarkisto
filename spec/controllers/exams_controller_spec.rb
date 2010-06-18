require 'spec_helper'

describe ExamsController do

     before :each do
          @course_mock = mock_model Course
     end

     it "should use ExamsController" do
          controller.should be_an_instance_of(ExamsController)
     end

     describe "GET 'index'" do
          it "should be successful" do
               Course.should_receive(:find_by_id).with('1').and_return(@course_mock)

               get 'index', :course_id => 1

               assigns(:course).should == @course_mock
               response.should be_success
          end
     end

     describe "GET 'show'" do
          it "should be successful" do
               @exam_mock = mock_model Exam

               Course.should_receive(:find_by_id).with('1').and_return(@course_mock)
               Exam.should_receive(:find_by_id).with('1').and_return(@exam_mock)

               get 'show', :course_id => 1, :id => 1

               assigns(:course).should == @course_mock
               assigns(:exam).should == @exam_mock
               response.should be_success
          end
     end

     describe "GET 'new'" do
          it "should be successful" do
               Course.should_receive(:find_by_id).with('1').and_return(@course_mock)

               get 'new', :course_id => 1

               assigns(:course).should == @course_mock
               response.should be_success
          end
     end

     describe "GET 'generate'" do
          it "should be successful" do
               Course.should_receive(:find_by_id).with('1').and_return(@course_mock)

               get 'generate', :course_id => 1

               assigns(:course).should == @course_mock
               response.should be_success
          end
     end

end

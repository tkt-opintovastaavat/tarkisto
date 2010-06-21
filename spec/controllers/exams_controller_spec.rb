require 'spec_helper'

describe ExamsController do

     before :each do
          @course_mock = mock_model Course
          @exam_mock = mock_model Exam
          @exam_type_mock = mock_model ExamType
          @course_id = '1'
          Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
     end

     describe "GET" do

          after :each do
               assigns(:course).should == @course_mock
               response.should be_success
          end

          describe "#index" do
               it "should be successful" do
                    get 'index', :course_id => @course_id
               end
          end

          describe "#show" do
               it "should be successful" do
                    Exam.should_receive(:find_by_id).with('1').and_return(@exam_mock)

                    get 'show', :course_id => @course_id, :id => 1

                    assigns(:exam).should == @exam_mock
               end
          end

          describe "#new" do
               it "should be successful" do
                    @course_mock.should_receive(:exams).and_return([@exam_mock])
                    ExamType.should_receive(:all).and_return([@exam_type_mock])

                    get 'new', :course_id => @course_id

                    assigns(:exams).should == [@exam_mock]
                    assigns(:exam_types).should == [@exam_type_mock]
               end
          end

          describe "#edit" do
               it "should be successful" do
                    Exam.should_receive(:find_by_id).with('1').and_return(@exam_mock)

                    get 'edit', :course_id => @course_id, :id => 1

                    assigns(:exam).should == @exam_mock
               end
          end

          describe "#generate" do
               it "should be successful" do
                    get 'generate', :course_id => @course_id
               end
          end

     end

     describe "POST" do

          describe "#create" do
               it "should be redirected" do
                    post 'create', :course_id => @course_id
                    response.should be_redirect
               end
          end

     end

end

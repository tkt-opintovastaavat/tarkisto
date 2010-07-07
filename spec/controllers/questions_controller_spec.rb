require 'spec_helper'

describe QuestionsController do

     describe "#show" do

          it "should ask the question data" do
               @course_mock = mock_model Course
               @exam_mock = mock_model Exam
               @exams_mock = [@exam_mock]
               @question_mock = mock_model Question
               @questions_mock = [@question_mock]

               @course_id = "1"
               @exam_id = "1"
               @question_id = "1"

               Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
               @course_mock.should_receive(:exams).and_return(@exams_mock)
               @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
               @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
               @exam_mock.should_receive(:questions).and_return(@questions_mock)
               @questions_mock.should_receive(:find_by_id).with(@question_id).and_return(@question_mock)


               get 'show', :course_id => @course_id, :exam_id => @exam_id, :id => @question_id, :format => :json

               assigns(:question).should == @question_mock

          end

     end

end

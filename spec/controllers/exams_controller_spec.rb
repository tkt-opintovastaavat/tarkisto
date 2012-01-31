require 'spec_helper'

describe ExamsController do

  before :each do
    @course_mock = mock_model Course
    @exam_mock = mock_model Exam
    @exams_mock = [@exam_mock]
    @type_mock = mock_model Type
    @question_mock = mock_model Question
    @course_id = '1'
    Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
    @course_mock.stub!(:id).and_return(@course_id)
    @exams_mock.stub!(:only_public).and_return(@exams_mock)
  end

  describe "GET" do

    describe "success" do

      after :each do
        assigns(:course).should == @course_mock
        response.should be_success
      end

      describe "#index" do

        it "should be successful" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @exams_mock.should_receive(:published).and_return(@exams_mock)
          get 'index', :course_id => @course_id
          assigns(:exams).should == [@exam_mock]
        end

      end

      describe "#show" do

        it "should be successful" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @exams_mock.should_receive(:published).and_return(@exams_mock)
          @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
          @exam_mock.should_receive(:questions).and_return(@question_mock)

          get 'show', :course_id => @course_id, :id => '1'

          assigns(:exam).should == @exam_mock
          assigns(:questions).should == @question_mock
        end

      end

    end

    describe "redirect or render" do

      before(:each) do
        @exam_id = '1'
      end

      describe "#show" do

        it "should redirect to index if not found with wanted id" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @exams_mock.should_receive(:published).and_return(@exams_mock)
          @exams_mock.should_receive(:find_by_id).with('1').and_return(nil)

          get 'show', :course_id => @course_id, :id => @exam_id

          response.should redirect_to(course_exams_path(@course_id))
        end

        it "should render json if so requested" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
          @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
          @exam_mock.should_receive(:to_public)

          get 'show', :course_id => @course_id, :id => @exam_id, :format => 'json'

        end

        it "should redirect to index if not found with wanted id pdf" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @exams_mock.should_receive(:published).and_return(@exams_mock)
          @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(nil)

          get 'show', :course_id => @course_id, :id => @exam_id, :format => :pdf

          response.should redirect_to(course_exams_path(@course_id))
        end

        it "should format pdf from given exam id" do
          @course_mock.should_receive(:exams).and_return(@exams_mock)
          @course_mock.should_receive(:name).and_return("foo")
          @exams_mock.should_receive(:published).and_return(@exams_mock)
          @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
          @exam_mock.should_receive(:name).and_return("bar")
          PdfExport.should_receive(:exam).with(@exam_mock).and_return(nil)
          controller.should_receive(:send_data).with(nil, :filename => "foo - bar.pdf").and_return(:success)
          controller.stub!(:render)

          get 'show', :course_id => @course_id, :id => @exam_id, :format => :pdf
        end

      end

    end

  end

end

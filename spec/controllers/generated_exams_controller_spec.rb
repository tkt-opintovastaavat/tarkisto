require 'spec_helper'

describe GeneratedExamsController do

  before(:each) do
    @course_id = '1'
    @course_mock = mock_model(Course)

    @exam_mock = mock_model(Exam)
    @exams_mock = [@exam_mock]

    @theme_mock = mock_model(Theme)
    @themes_mock = [@theme_mock]
  end

  describe "initialize generator" do

    before(:each) do
      Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
      @course_mock.should_receive(:exams).and_return(@exams_mock)
      @exams_mock.should_receive(:published).and_return(@exams_mock)
    end

    it "should use only public exams, when not logged in" do
      controller.should_receive(:signed_in?).and_return(false)
      @exams_mock.should_receive(:only_public).and_return(@exams_mock)
    end

    it "should use all exams, when logged in" do
      controller.should_receive(:signed_in?).and_return(true)
    end

    after(:each) do
      @course_mock.should_receive(:themes).and_return(@themes)

      get :new, :course_id => @course_id

      response.should be_success
    end

  end

  describe "generator in use" do

    it "should use only public exams, when not logged in"
    it "should use all exams, when logged in"

  end

end

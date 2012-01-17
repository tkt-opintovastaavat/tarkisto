require 'spec_helper'

describe CoursesController do

  before :each do
    @course_mock = mock_model Course
    @courses_mock = [@course_mock]

    @courses_mock.should_receive(:alphabetize).and_return(@courses_mock)
  end

  describe "#basics" do

    it "should be successful" do
      Course.should_receive(:basic_courses).and_return(@courses_mock)
      get 'basics'
    end

  end

  describe "#intermediates" do

    it "should be successful" do
      Course.should_receive(:intermediate_courses).and_return(@courses_mock)
      get 'intermediates'
    end

  end

  describe "#advanceds" do

    it "should be successful" do
      Course.should_receive(:advanced_courses).and_return(@courses_mock)
      get 'advanceds'
    end

  end

  describe "#others" do

    it "should be successful" do
      Course.should_receive(:other_courses).and_return(@courses_mock)
      get 'others'
    end

  end

  after(:each) do
    assigns(:courses).should == @courses_mock
  end

end

require 'spec_helper'

describe DashboardController do

  before :each do
    @level_mock = mock_model Level
    @course_mock = mock_model Course
    @courses_mock = [@course_mock]
  end

  it "should use DashboardController" do
    controller.should be_an_instance_of(DashboardController)
  end

  describe "GET 'show'" do
    it "should be successful" do
      [:basic_courses,
       :intermediate_courses,
       :advanced_courses,
       :other_courses
      ].each do |course_level|
        Course.should_receive(course_level).and_return(@courses_mock)
        @courses_mock.should_receive(:alphabetize).and_return(@courses_mock)
        @courses_mock.should_receive(:courses_on_semester).and_return(@courses_mock)
      end

      get :show
      assigns(:basic_studies).should==[@course_mock]
      assigns(:intermediate_studies).should==[@course_mock]
      assigns(:advanced_studies).should==[@course_mock]
      assigns(:other_studies).should==[@course_mock]
      response.should be_success
    end
  end

end

require 'spec_helper'

describe DashboardController do

     before :each do
          @course_level_mock = mock_model CourseLevel
          @course_mock = mock_model Course
     end

     it "should use DashboardController" do
          controller.should be_an_instance_of(DashboardController)
     end

     describe "GET 'show'" do
          it "should be successful" do
               CourseLevel.should_receive(:find_by_name).with("Perusopinnot").and_return(@course_level_mock)
               CourseLevel.should_receive(:find_by_name).with("Aineopinnot").and_return(@course_level_mock)
               CourseLevel.should_receive(:find_by_name).with("Muut opinnot").and_return(@course_level_mock)
               CourseLevel.should_receive(:find_by_name).with("Syventävät opinnot").and_return(@course_level_mock)
               4.times do
                    @course_level_mock.should_receive(:courses).and_return([@course_mock])
               end
               get 'show'
               assigns(:basic_studies).should==[@course_mock]
               assigns(:intermediate_studies).should==[@course_mock]
               assigns(:advanced_studies).should==[@course_mock]
               assigns(:other_studies).should==[@course_mock]
               response.should be_success
          end
     end

end

require 'spec_helper'

describe DashboardController do

     before :each do
          @level_mock = mock_model Level
          @course_mock = mock_model Course
     end

     it "should use DashboardController" do
          controller.should be_an_instance_of(DashboardController)
     end

     describe "GET 'show'" do
          it "should be successful" do
               Level.should_receive(:find_by_name_fi).with("Perusopinnot").and_return(@level_mock)
               Level.should_receive(:find_by_name_fi).with("Aineopinnot").and_return(@level_mock)
               Level.should_receive(:find_by_name_fi).with("Muut opinnot").and_return(@level_mock)
               Level.should_receive(:find_by_name_fi).with("Syventävät opinnot").and_return(@level_mock)
               4.times do
                    @level_mock.should_receive(:courses).and_return([@course_mock])
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

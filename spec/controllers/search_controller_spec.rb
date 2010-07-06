require 'spec_helper'

describe SearchController do

     it "should use SearchController" do
          controller.should be_an_instance_of(SearchController)
     end

     describe "GET 'show'" do
          it "should be successful" do
               get 'show'
               response.should be_success
          end
          it "should receive query variable" do
               get 'show', :query => "lama"
               assigns(:q).should == "lama"
          end
          it "should search course from result database" do
               get 'show', :query => "lama"
               assigns(:result).should == [{"key" => "lama", "name" => "Laskennan mallit", "course_id" => 1}]
          end
          #siirrä tämäkin course_controller_speciin
          it "should search all courses" do
               @course_mock = mock_model Course
               @course_mock.should_receive(:name).twice.and_return("fu-")
               Course.should_receive(:all).and_return([@course_mock])
               get 'courses', :format => :json
          end
     end

end

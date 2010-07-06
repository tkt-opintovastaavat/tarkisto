require 'spec_helper'

describe SearchController do

     it "should use SearchController" do
          controller.should be_an_instance_of(SearchController)
     end

     describe "GET 'show'" do
          before :each do
               @course_mock = mock_model Course
          end    
     
          it "should be successful" do
               get 'show'
               response.should be_success
          end
          it "should receive query variable" do
               get 'show', :query => "lama"
               assigns(:p).should == "lama"
          end
          it "should search course from result database" do
               Course.should_receive(:search).and_return [@course_mock] 
               get 'show', :query => "lama"
               assigns(:result).should == [@course_mock]
          end
          #siirrä tämäkin course_controller_speciin
          it "should search all courses" do
               @course_mock.should_receive(:name).twice.and_return("fu-")
               Course.should_receive(:search).with("fu-").and_return([@course_mock])
               get 'courses', :term => "fu-", :format => :json
          end
     end

end

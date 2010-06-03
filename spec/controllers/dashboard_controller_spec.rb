require 'spec_helper'

describe DashboardController do

     it "should use DashboardController" do
          controller.should be_an_instance_of(DashboardController)
     end

     describe "GET 'show'" do
          it "should be successful" do
               get 'show'
               response.should be_success
          end
     end

end

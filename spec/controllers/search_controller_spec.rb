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
     end

end

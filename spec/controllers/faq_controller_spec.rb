require 'spec_helper'

describe FaqController do

     it "should use FaqController" do
          controller.should be_an_instance_of(FaqController)
     end

     describe "GET 'show'" do
          it "should be successful" do
               get 'show'
               response.should be_success
          end
     end

end

require 'spec_helper'

describe SessionController do

     it "should use SessionController" do
          controller.should be_an_instance_of(SessionController)
     end
  
     describe "POST 'create'" do
          it "should be succesful" do
               post 'create', :username => "petri", :password => "karjalainen"
               response.should be_redirect
               session[:user_id].should == 1
          end
     end
     
     describe "DELETE 'destroy'" do
          it "should be succesful" do
               post 'destroy'
               response.should be_redirect
               session[:user_id].should == nil
          end
     end

end

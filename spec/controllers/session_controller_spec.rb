require 'spec_helper'

describe SessionController do

     before(:each) do
          @user_mock = mock_model(User)
     end

     it "should use SessionController" do
          controller.should be_an_instance_of(SessionController)
     end

     describe "POST 'create'" do
          it "should be succesful" do
               User.should_receive(:authetication).with("petri", "karjalainen").and_return(@user_mock)
               post 'create', :session => { :username => "petri", :password => "karjalainen" }
               response.should be_redirect
               session[:user_id].should == @user_mock.id
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

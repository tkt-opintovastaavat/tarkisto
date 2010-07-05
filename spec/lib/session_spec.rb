require 'spec_helper'

describe Session do
     include Session

     before(:each) do
          @user_mock = mock_model User
     end

     describe "#logged_in?" do

          it "should tell, if user is logged in" do
               should_receive(:current_user).and_return(@user_mock)
               logged_in?.should == true
          end

          it "should tell, if user isn't logged in" do
               should_receive(:current_user).and_return(nil)
               logged_in?.should == false
          end

     end

# #current_user specs you will find in SessionController-specs.

end

require 'spec_helper'

describe User do
     before(:each) do
          @valid_attributes = {
               :username => 'ptkarjal',
               :email => 'ptkarjal@cs.helsinki.fi',
               :language => 'fi'
          }
     end


     describe "creation" do
          it "should create a new instance given valid attributes" do
               User.create!(@valid_attributes)
          end
     end

     describe "authentication" do
          it "should receive valid arguments" do
               LDAP.should_receive(:authenticate).with("petri", "karjalainen").and_return(true)
               User.authentication("petri", "karjalainen").username.should == "petri"
          end
          it "should create the account if it does not exist in the database" do
               LDAP.should_receive(:authenticate).with("petri", "karjalainen").and_return(true)
               User.should_receive(:find_by_username).and_return(nil)
               User.should_receive(:create).and_return(User.new :username => "petri")
               User.authentication("petri", "karjalainen").username.should == "petri"
          end
          it "should already have the account in the database" do
               LDAP.should_receive(:authenticate).with("petri", "karjalainen").and_return(true)
               User.should_receive(:find_by_username).and_return(User.new :username => "petri")
               User.should_not_receive(:create)
               User.authentication("petri", "karjalainen").username.should == "petri"
          end
          it "should fail when it receives invalid arguments" do
               LDAP.should_receive(:authenticate).with("petri", "karjalainen").and_return(false)
               User.authentication("petri", "karjalainen").should == nil
          end
     end
end

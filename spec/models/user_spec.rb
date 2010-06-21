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

          before(:each) do
               @username = "petri"
               @password = "karjalainen"
          end

          it "should receive valid arguments" do
               LDAP.should_receive(:authenticate).with(@username, @password).and_return(true)
               LDAP.should_receive(:departmentcheck).with(@username).and_return(true)
               User.authentication(@username, @password).username.should == @username
          end

          it "should create the account if it does not exist in the database" do
               LDAP.should_receive(:authenticate).with(@username, @password).and_return(true)
               LDAP.should_receive(:departmentcheck).with(@username).and_return(true)
               User.should_receive(:find_by_username).and_return(nil)
               User.should_receive(:create).and_return(User.new :username => "petri")
               User.authentication(@username, @password).username.should == @username
          end

          it "should already have the account in the database" do
               LDAP.should_receive(:authenticate).with(@username, @password).and_return(true)
               LDAP.should_receive(:departmentcheck).with(@username).and_return(true)
               User.should_receive(:find_by_username).and_return(User.new :username => "petri")
               User.should_not_receive(:create)
               User.authentication(@username, @password).username.should == @username
          end

          it "should fail when it receives invalid username or password" do
               LDAP.should_receive(:authenticate).with(@username, @password).and_return(false)
               User.authentication(@username, @password).should == nil
          end

          it "should fail when department check fails" do
               LDAP.should_receive(:authenticate).with(@username, @password).and_return(true)
               LDAP.should_receive(:departmentcheck).with(@username).and_return(false)
               User.authentication(@username, @password).should == nil
          end

     end
end

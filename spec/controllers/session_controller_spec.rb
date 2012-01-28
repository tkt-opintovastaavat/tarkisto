require 'spec_helper'

describe SessionController do
  include Session

  before(:each) do
    @user_mock = mock_model(User)
  end

  it "should use SessionController" do
    controller.should be_an_instance_of(SessionController)
  end

  describe "POST 'create'" do

    it "should be succesful" do
      User.should_receive(:authentication).with("petri", "karjalainen").and_return(@user_mock)
      @user_mock.should_receive(:access).and_return(1)
      post 'create', :session => { :username => "petri", :password => "karjalainen" }
      response.should be_redirect
      session[:user_id].should == @user_mock.id
    end

    it "should give a notification if failed" do
      User.should_receive(:authentication).with("petri", "karjalainen").and_return(nil)
      post 'create', :session => { :username => "petri", :password => "karjalainen" }
      response.should be_redirect
      flash[:session_error].should == I18n.t('pages.session.errors.login_failed')
    end

  end

  describe "DELETE 'destroy'" do

    it "should be succesful" do
      post 'destroy'
      response.should be_redirect
      session[:user_id].should == nil
      flash[:session_notification].should == I18n.t('pages.session.notifications.logout')
    end

  end

  describe "session variable tests" do

    it "should return the user if found" do
      session[:user_id] = 1
      User.should_receive(:find_by_id).with(1).and_return(@user_mock)
      current_user.should == @user_mock
    end

    it "should return nil if not found" do
      session[:user_id] = 1
      User.should_receive(:find_by_id).with(1).and_return(nil)
      current_user.should == nil
    end

    it "should return nil if session isn't set" do
      session[:user_id] = nil
      current_user.should == nil
    end

  end

end

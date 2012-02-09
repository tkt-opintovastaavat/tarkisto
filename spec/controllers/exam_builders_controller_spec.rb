require 'spec_helper'

describe ExamBuildersController do

  before(:each) do
    @user = Factory.create(:user)
    sign_in @user
  end

  describe "GET 'show'" do
    it "returns http success" do
      get :show, :course_id => 1
      response.should be_success
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, :course_id => 1
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post :create, :course_id => 1
      response.should be_success
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      get :edit, :course_id => 1
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      put :update, :course_id => 1
      response.should be_success
    end
  end

end

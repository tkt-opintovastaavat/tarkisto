require 'spec_helper'

describe ExamBuildersController do

  before(:each) do
    @user = Factory.create(:user)
    sign_in @user
    @course = Factory.create(:course)
  end

  describe "GET 'show'" do
    it "returns http success" do
      exam = Factory.create(:exam, :course_id => @course.id)
      Factory.create(:exam_builder, :user_id => @user.id, :exam_id => exam.id)
      get :show, :course_id => @course.id
      response.should be_success
    end

    it "redirects when no builders set" do
      get :show, :course_id => @course.id
      response.should be_redirect
    end
  end

  describe "GET 'new'" do
    it "returns http success" do
      get :new, :course_id => @course.id
      response.should be_success
    end
  end

  describe "GET 'create'" do
    it "returns http success" do
      post :create, :course_id => @course.id, :exam_builder => {:type_id => 1, :date => Date.today, :maximum_points => 60}
      response.should be_redirect
    end
  end

  describe "GET 'edit'" do
    it "returns http success" do
      exam = Factory.create(:exam, :course_id => @course.id)
      Factory.create(:exam_builder, :user_id => @user.id, :exam_id => exam.id)
      get :edit, :course_id => @course.id
      response.should be_success
    end
  end

  describe "GET 'update'" do
    it "returns http success" do
      exam = Factory.create(:exam, :course_id => @course.id)
      Factory.create(:exam_builder, :user_id => @user.id, :exam_id => exam.id)
      put :update, :course_id => @course.id
      response.should be_success
    end
  end

  describe "DELETE 'destroy'" do
    it "returns http success" do
      exam = Factory.create(:exam, :course_id => @course.id)
      Factory.create(:exam_builder, :user_id => @user.id, :exam_id => exam.id)
      delete :destroy, :course_id => @course.id
      response.should be_redirect
    end
  end

end

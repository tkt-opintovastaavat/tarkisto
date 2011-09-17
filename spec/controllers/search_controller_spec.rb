require 'spec_helper'

describe SearchController do

  it "should use SearchController" do
    controller.should be_an_instance_of(SearchController)
  end

  describe "GET 'show'" do
    before :each do
      @course_mock = mock_model Course
    end

    it "should be successful" do
      get 'show'
      response.should be_success
    end
    it "should receive query variable" do
      get 'show', :query => "lama"
      assigns(:p).should == "lama"
    end
    it "should search course from result database" do
      Course.should_receive(:search).and_return [@course_mock]
      get 'show', :query => "lama"
      assigns(:result).should == [@course_mock]
    end
    #siirrä tämäkin course_controller_speciin
    it "should search all courses" do
      @label = "fu-"
      @course_mock.should_receive(:name).twice.and_return(@label)
      @label.should_receive(:size).and_return(3)
      Course.should_receive(:search).with("fu-").and_return([@course_mock])
      get 'courses', :term => "fu-", :format => :json
    end

    it "should search all courses and label is too long" do
      @label = "English Academic & Professional Skills: Reading, Writing & >> Spoken Communication (CEFR B2)"
      @course_mock.should_receive(:name).twice.and_return(@label)
      @label.should_receive(:size).and_return(64)
      @label.should_receive(:[]).with(0...55)
      Course.should_receive(:search).with("English Academic & Professional Skills: Reading, Writin...").and_return([@course_mock])
      get 'courses', :term => "English Academic & Professional Skills: Reading, Writin...", :format => :json
    end
  end

end

require 'spec_helper'

describe Exam do

  before(:each) do
    @valid_attributes = {
      :type_id => 1 ,
      :course_id => 2 ,
      :maximum_points => 60 ,
      :date => Date.today
    }
    @valid_exam = Exam.new @valid_attributes
    @invalid_exam = Exam.new
  end

  describe "accessibility" do

    it "should not allow publishing changes outside" do
      @valid_exam.published.should == false
      @valid_exam.update_attributes :published => true
      @valid_exam.published.should == false
    end

    it "should not allow publicity changes outside" do
      @valid_exam.public.should == true
      @valid_exam.update_attributes :published => false
      @valid_exam.public.should == true
    end

  end

  describe "validation" do

    it "should create a new instance given valid attributes" do
      Exam.create!(@valid_attributes)
    end

    it "should should be public by default" do
      Exam.create!(@valid_attributes).public.should == true
    end

    it "should should be unpublished by default" do
      Exam.create!(@valid_attributes).published.should == false
    end

    it "should have maximum points" do
      @invalid_exam.should have(1).error_on(:maximum_points)
    end

    it "should have numeric maximum points" do
      @invalid_exam.maximum_points = 'asd'
      @invalid_exam.should have(1).error_on(:maximum_points)
    end

    it "should have positive number on maximum points" do
      @invalid_exam.maximum_points = 0
      @invalid_exam.should have(1).error_on(:maximum_points)
    end

    it "should have integer on maximum points" do
      @invalid_exam.maximum_points = 0.1
      @invalid_exam.should have(1).error_on(:maximum_points)
    end

    it "should have a date" do
      @invalid_exam.should have(1).error_on(:date)
    end

    it "should have points error" do
      @valid_exam.should have(0).error_on(:maximum_points)
      @valid_exam.save
      @valid_exam.questions.new(:points => 20).save(false)
      @valid_exam.should have(1).error_on(:maximum_points)
    end

    it "should have same amount of points in questions than maximum points" do
      @valid_exam.should have(0).error_on(:maximum_points)
      @valid_exam.save
      @valid_exam.questions.new(:points => 20).save(false)
      @valid_exam.questions.new(:points => 40).save(false)
      @valid_exam.should have(0).error_on(:maximum_points)
    end

  end

  it "should format name"# do
#    type_mock = mock_model Type
#    @valid_exam.stub!(:type).and_return(type_mock)
#    type_mock.stub!(:name).and_return("Erilliskoe")
#    @valid_exam.name.should == "#{@valid_exam.type.name} #{I18n.l @valid_exam.date, :format => :short}"
#  end

  describe "publishing" do

    it "should return only unpublished exams if asked so" do
      unpublished_exams = Exam.unpublished
      unpublished_exams.each do |exam|
        exam.published.should == false
      end
    end

    it "should return only published exams if asked so" do
      published_exams = Exam.published
      published_exams.each do |exam|
        exam.published.should == true
      end
    end

    it "should publish exam, when asked and it has valid questions" do
      exam = Exam.create!(@valid_attributes)
      exam.published.should == false
      exam.questions.create! :name => "test question", :points => 60, :number => 1 #FIXME: use fixtures
      exam.publish!.should == true
      exam.published.should == true
    end

    it "shouldn't publish exam if it hasn't any questions" do
      exam = Exam.create!(@valid_attributes)
      exam.published.should == false
      exam.publish!.should == false
      exam.published.should == false
    end

    it "shouldn't publish exam if it has any invalid questions" do
      exam = Exam.create!(@valid_attributes)
      exam.published.should == false
      question = exam.questions.new
      question.save(false)
      exam.publish!.should == false
      exam.published.should == false
    end

    it "shouldn't publish, if points doesn't match" do
      exam = Exam.create!(@valid_attributes)
      exam.published.should == false
      exam.questions.create! :name => "test question", :points => 10, :number => 1 #FIXME: use fixtures
      exam.publish!.should == false
      exam.published.should == false
    end

    it "should unpublish exam, when asked" do
      exam = Exam.create! @valid_attributes
      exam.published.should == false
      exam.questions.create! :name => "test question", :points => 60, :number => 1 #FIXME: use fixtures
      exam.publish!.should == true
      exam.published.should == true
      exam.unpublish!#.should == true
      exam.published.should == false
    end

  end

  describe "publicity" do

    it "should return only private exams if asked so" do
      private_exams = Exam.only_private
      private_exams.each do |exam|
        exam.public.should == false
      end
    end

    it "should return only public exams if asked so" do
      public_exams = Exam.only_public
      public_exams.each do |exam|
        exam.public.should == true
      end
    end

    it "should return hash of public information" do
      @valid_exam.to_public.should == {:id => @valid_attributes[:id], :type => @valid_attributes[:type_id], :edate => I18n.l(@valid_attributes[:date], :format => :short), :maxpoints => @valid_attributes[:maximum_points]}
    end

  end

  describe "#build_exam" do

    it "should create exam from hash" do
      date = Date.today
      data = { 'type_id' => 1, 'date' => date, 'maximum_points' => 60 }
      exam = Exam.build_exam data
      exam.type.id.should == 1
      exam.date.should == date
      exam.maximum_points.should == 60
    end

  end

end

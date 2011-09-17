require 'spec_helper'

describe Question do
  before(:each) do
    @valid_attributes = {
      :number => 1 ,
      :description => 'Kuvaile äärelliset automaatit' ,
      :name => 'Äärelliset automaatit' ,
      :points => 8 ,
      :exam_id => 1
    }
    @invalid_question = Question.new
  end

  it "should create a new instance given valid attributes" do
    Question.create!(@valid_attributes)
  end

  it "should have name info" do
    @invalid_question.should have(1).error_on(:name)
  end
  it "should have points info" do
    @invalid_question.should have(1).error_on(:points)
  end

  it "should have number info" do
    @invalid_question.should have(1).error_on(:number)
  end

  it "should return themes" do
    @course_theme_mock = mock_model CourseTheme
    @theme_mock = mock_model Theme
    @themes = [@theme_mock]

    question = Question.new
    question.should_receive(:course_themes).and_return([@course_theme_mock])
    @course_theme_mock.should_receive(:theme).and_return(@theme_mock)

    question.themes.should == @themes
  end

end

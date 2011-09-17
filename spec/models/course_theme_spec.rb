require 'spec_helper'

describe CourseTheme do
  before(:each) do
    @valid_attributes = {
      :theme_id => 1 ,
      :description_fi => "Äärelliset automaatit" ,
      :course_id => 1
    }
    @invalid_course_theme = CourseTheme.new
  end

  it "should create a new instance given valid attributes" do
    CourseTheme.create!(@valid_attributes)
  end

  it "should have a valid references to foreign key from theme" do
    @invalid_course_theme.should have(1).error_on(:theme_id)
  end

  it "should have a valid references to foreign key from course" do
    @invalid_course_theme.should have(1).error_on(:course_id)
  end

end

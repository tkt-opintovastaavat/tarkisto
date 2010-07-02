require 'spec_helper'

describe Course do
     before(:each) do
          @valid_attributes = {
               :code => 12345 ,
               :name_fi => 'Ohjelmoinnin perusteet' ,
               :level_id => 1 ,
               :credits => 5 ,
               :replaced_by => 2
          }
          @invalid_course = Course.new
     end

     it "should create a new instance given valid attributes" do
          Course.create!(@valid_attributes)
     end

     it "should have a course code" do
          @invalid_course.should have(1).error_on(:code)          
     end

     it "should have a name" do
          @invalid_course.should have(1).error_on(:name_fi)          
     end

     it "should have credits" do
          @invalid_course.should have(1).error_on(:credits)
     end

     it "should return name in correct language" do
          course = Course.new :name_fi => "Suomeksi", :name_en => "In English", :name_se => "På Svenska"
          I18n.locale= :fi
          course.name.should == "Suomeksi"
          I18n.locale= :en
          course.name.should == "In English"
          I18n.locale= :se
          course.name.should == "På Svenska"
     end
end

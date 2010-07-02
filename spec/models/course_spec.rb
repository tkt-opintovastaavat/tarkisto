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

     describe "name with different languages" do

          it "should return name in Finnish" do
               course = Course.new :name_fi => "Suomeksi"
               I18n.stub!(:locale).and_return(:fi)
               course.name.should == "Suomeksi"
          end

          it "should return name in English" do
               course = Course.new :name_en => "In English"
               I18n.stub!(:locale).and_return(:en)
               course.name.should == "In English"
          end

          it "should return name in Swedish" do
               course = Course.new :name_se => "På Svenska"
               I18n.stub!(:locale).and_return(:se)
               course.name.should == "På Svenska"
          end

     end

end

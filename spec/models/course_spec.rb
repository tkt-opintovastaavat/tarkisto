require 'spec_helper'

describe Course do
     before(:each) do
          @valid_attributes = {
               :code => 12345 ,
               :name_fi => 'Ohjelmoinnin perusteet' ,
               :name_se => 'Introduktion till programmering' ,
               :name_en => 'Introduction to Programming' ,
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
     
     describe "#search" do
          
          before :each do 
               Course.create! @valid_attributes
          end
          
          it "should search by full name in finnish" do
               results = Course.search "Ohjelmoinnin perusteet"
               found = false
               results.each do |result|
                    found = true if result.name == "Ohjelmoinnin perusteet"
               end
               found.should == true

          end
          
          it "should search by partial" do
               results = Course.search "moin"
               found = false
               results.each do |result|
                    found = true unless result.name.scan(/moin/).empty? 
               end
               found.should == true
          end
          
          it "should search name in English" do
               I18n.stub!(:locale).and_return(:en)
               results = Course.search "Introduction to Programming"
               found = false
               results.each do |result|
                    found == true if result.name == "Introduction to Programming"
               end
          end

          it "should search name in Swedish" do
               I18n.stub!(:locale).and_return(:se)
               results = Course.search "Introduktion till programmering"
               found = false
               results.each do |result|
                    found == true if result.name == "Introduktion till programmering"
               end
          end
          
          it "should return nil if locale fails" do
               I18n.stub!(:locale).and_return(nil)
               results = Course.search "Ohjelmoinnin perusteet"
               results.should == nil
          end
          
          it "should sort using sorting_priority sit1" do
               course1 = mock_model Course
               course2 = mock_model Course
               course1_name = "course1"
               course2_name = "course2"
               course1.stub!(:name).and_return course1_name
               course2.stub!(:name).and_return course2_name
               course1_name.should_receive(:scan).and_return [{}]
               course2_name.should_receive(:scan).and_return [{}]
               situation = Course.sorting_priority "cour", course1, course2             
               situation.should == -1
          end

          it "should sort using sorting_priority sit2" do
               course1 = mock_model Course
               course2 = mock_model Course
               course1_name = "course1"
               course2_name = "ohpe"
               course1.stub!(:name).and_return course1_name
               course2.stub!(:name).and_return course2_name
               course1_name.should_receive(:scan).and_return [{}]
               course2_name.should_receive(:scan).and_return [{}]
               situation = Course.sorting_priority "cour", course1, course2             
               situation.should == -1
          end
            
          it "should sort using sorting_priority sit3" do
               course1 = mock_model Course
               course2 = mock_model Course
               course1_name = "ohpe"
               course2_name = "course2"
               course1.stub!(:name).and_return course1_name
               course2.stub!(:name).and_return course2_name
               course1_name.should_receive(:scan).and_return [{}]
               course2_name.should_receive(:scan).and_return [{}]
               situation = Course.sorting_priority "cour", course1, course2             
               situation.should == 1
          end
               
          it "should sort using sorting_priority sit4" do
               course1 = mock_model Course
               course2 = mock_model Course
               course1_name = "course1"
               course2_name = "course2"
               course1.stub!(:name).and_return course1_name
               course2.stub!(:name).and_return course2_name
               course1_name.should_receive(:scan).and_return [{}]
               course2_name.should_receive(:scan).and_return [{}]
               situation = Course.sorting_priority "ohpe", course1, course2             
               situation.should == -1     
          end
     end
end

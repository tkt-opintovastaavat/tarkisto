require 'spec_helper'

describe Type do
     before(:each) do
          @valid_attributes = {
               :name_fi => 'Kurssikoe'
          }
          @invalid_type = Type.new
     end

     it "should create a new instance given valid attributes" do
          Type.create!(@valid_attributes)
     end

     it "should have a name" do
          @invalid_type.should have(1).error_on(:name_fi)
     end

     describe "name with different languages" do

          it "should return name in Finnish" do
               course = Type.new :name_fi => "Suomeksi"
               I18n.stub!(:locale).and_return(:fi)
               course.name.should == "Suomeksi"
          end

          it "should return name in English" do
               course = Type.new :name_en => "In English"
               I18n.stub!(:locale).and_return(:en)
               course.name.should == "In English"
          end

          it "should return name in Swedish" do
               course = Type.new :name_se => "På Svenska"
               I18n.stub!(:locale).and_return(:se)
               course.name.should == "På Svenska"
          end

     end

end

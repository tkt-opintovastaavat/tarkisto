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

     it "should return name in correct language" do
          type = Type.new :name_fi => "Suomeksi", :name_en => "In English", :name_se => "På Svenska"
          I18n.locale= :fi
          type.name.should == "Suomeksi"
          I18n.locale= :en
          type.name.should == "In English"
          I18n.locale= :se
          type.name.should == "På Svenska"
     end
end

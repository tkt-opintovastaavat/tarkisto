require 'spec_helper'

describe Image do
     before(:each) do
          @valid_attributes = {
               :image_path => 'c:\\temp' ,
               :question_id => 1
          }
          @invalid_image = Image.new
     end

     it "should create a new instance given valid attributes" do
          Image.create!(@valid_attributes)
     end
     
     it "should have imagepath" do
          @invalid_image.should have(1).error_on(:image_path)          
     end     
end

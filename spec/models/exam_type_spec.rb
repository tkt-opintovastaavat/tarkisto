require 'spec_helper'

describe ExamType do
     before(:each) do
          @valid_attributes = {
               :name => 'Kurssikoe'
          }
          @invalid_exam_type = ExamType.new
     end

     it "should create a new instance given valid attributes" do
          ExamType.create!(@valid_attributes)
     end

     it "should have a name" do
          @invalid_exam_type.should have(1).error_on(:name)
     end

end

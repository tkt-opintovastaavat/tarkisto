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
     it "should have description info" do
          @invalid_question.should have(1).error_on(:description)
     end
     it "should have points info" do
          @invalid_question.should have(1).error_on(:points)
     end
     
     it "should have number info" do
          @invalid_question.should have(1).error_on(:number)
     end     
     
end

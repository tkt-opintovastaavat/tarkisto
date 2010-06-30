require 'spec_helper'

describe CodeSnippet do
     before(:each) do
          @valid_attributes = {
               :text => 'public static void main' ,
               :question_id => 2
          }
          @invalid_code_snippet = CodeSnippet.new
     end

     it "should create a new instance given valid attributes" do
          CodeSnippet.create!(@valid_attributes)
     end
     
     it "should have code text" do
          @invalid_code_snippet.should have(1).error_on(:text)          
     end     
end

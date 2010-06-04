require 'spec_helper'

describe ExamsController do

     it "should use ExamsController" do
          controller.should be_an_instance_of(ExamsController)
     end

     describe "GET 'index'" do
          it "should be successful" do
               get 'index', :course_id => 1
               response.should be_success
          end
     end

     describe "GET 'show'" do
          it "should be successful" do
               get 'show', :course_id => 1, :id => 1
               response.should be_success
          end
     end

     describe "GET 'new'" do
          it "should be successful" do
               get 'new', :course_id => 1
               response.should be_success
          end
     end

     describe "GET 'generate'" do
          it "should be successful" do
               get 'generate', :course_id => 1
               response.should be_success
          end
     end

end

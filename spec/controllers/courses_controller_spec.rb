require 'spec_helper'

describe CoursesController do

     before :each do
          @course_mock = mock_model Course
     end

     describe "#basics" do

          it "should be successful" do
               Course.should_receive(:basic_courses).and_return([@course_mock])

               get 'basics'

               assigns(:courses).should == [@course_mock]
          end

     end

     describe "#intermediates" do

          it "should be successful" do
               Course.should_receive(:intermediate_courses).and_return([@course_mock])

               get 'intermediates'

               assigns(:courses).should == [@course_mock]
          end

     end

     describe "#advanceds" do

          it "should be successful" do
               Course.should_receive(:advanced_courses).and_return([@course_mock])

               get 'advanceds'

               assigns(:courses).should == [@course_mock]
          end

     end

     describe "#others" do

          it "should be successful" do
               Course.should_receive(:other_courses).and_return([@course_mock])

               get 'others'

               assigns(:courses).should == [@course_mock]
          end

     end

end

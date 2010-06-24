require 'spec_helper'

describe ExamsController do

     before :each do
          @course_mock = mock_model Course
          @exam_mock = mock_model Exam
          @exams_mock = [@exam_mock]
          @exam_type_mock = mock_model ExamType
          @course_id = '1'
          Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
     end

     describe "GET" do

          describe "success" do
               after :each do
                    assigns(:course).should == @course_mock
                    response.should be_success
               end

               describe "#index" do
                    it "should be successful" do
                         get 'index', :course_id => @course_id
                    end
               end

               describe "#show" do
                    it "should be successful" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)

                         get 'show', :course_id => @course_id, :id => 1

                         assigns(:exam).should == @exam_mock
                    end
               end

               describe "#new" do
                    it "should be successful" do
                         Exam.should_receive(:new).and_return(@exam_mock)
                         @course_mock.should_receive(:exams).and_return([@exam_mock])
                         ExamType.should_receive(:all).and_return([@exam_type_mock])

                         get 'new', :course_id => @course_id

                         assigns(:exam).should == @exam_mock
                         assigns(:exams).should == [@exam_mock]
                         assigns(:exam_types).should == [@exam_type_mock]
                    end
               end

               describe "#edit" do

                    it "should be successful" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:published).and_return(false)

                         get 'edit', :course_id => @course_id, :id => 1

                         assigns(:exam).should == @exam_mock
                    end

               end

               describe "#generate" do
                    it "should be successful" do
                         get 'generate', :course_id => @course_id
                    end
               end

          end

          describe "redirect" do

               describe "#edit" do

                    it "should redirect to show if tries to edit published exam" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:published).and_return(true)
                         @course_mock.stub!(:id).and_return(1)
                         @exam_mock.stub!(:id).and_return(1)

                         get 'edit', :course_id => @course_id, :id => 1

                         response.should redirect_to(exam_url(@course_id, 1))
                    end

               end
          end

     end

     describe "POST" do

          before :each do
               @course_mock.stub!(:id).and_return(@course_id)
               @exam_id = '1'
          end

          describe "#create" do

               it "should confirm old data and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
                    @exam_mock.should_receive(:id).and_return(@exam_id)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    post 'create', :course_id => @course_id, :exam => {:id => @exam_id}
                    response.should redirect_to(edit_exam_url(@course_id, @exam_id))
               end

               it "should be redirected back to new page if missing attributes." do
                    post 'create', :course_id => @course_id
                    response.should redirect_to(new_exam_url(@course_id))
               end

               it "should be redirected back to new page if invalid attributes." do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(true)
                    post 'create', :course_id => @course_id, :exam => {:exam_type_id => '1', :date => Date.today}
                    response.should redirect_to(new_exam_url(@course_id))
               end

               it "should save new data (id return nil) and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).twice.and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(nil)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    @exam_mock.stub!(:id).and_return(2)
                    post 'create', :course_id => @course_id, :exam => {:id => @exam_id}
                    response.should redirect_to(edit_exam_url(@course_id, @exam_mock.id))
               end

               it "should save new data (id isn't set) and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_not_receive(:find_by_id)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    @exam_mock.stub!(:id).and_return(3)
                    post 'create', :course_id => @course_id, :exam => {:exam_type_id => '1', :date => Date.today, :maximum_points => '60'}
                    response.should redirect_to(edit_exam_url(@course_id, @exam_mock.id))
               end

          end

     end

end

require 'spec_helper'

describe ExamsController do

     before :each do
          @course_mock = mock_model Course
          @exam_mock = mock_model Exam
          @exams_mock = [@exam_mock]
          @type_mock = mock_model Type
          @question_mock = mock_model Question
          @course_id = '1'
          Course.should_receive(:find_by_id).with(@course_id).and_return(@course_mock)
          @course_mock.stub!(:id).and_return(@course_id)
     end

     describe "GET" do

          describe "success" do

               after :each do
                    assigns(:course).should == @course_mock
                    response.should be_success
               end

               describe "#index" do

                    it "should be successful" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:published).and_return([@exam_mock])
                         get 'index', :course_id => @course_id
                         assigns(:exams).should == [@exam_mock]
                    end

               end

               describe "#show" do

                    it "should be successful" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:published).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:questions).and_return(@question_mock)

                         get 'show', :course_id => @course_id, :id => 1

                         assigns(:exam).should == @exam_mock
                         assigns(:questions).should == @question_mock
                    end

               end

               describe "#new" do

                    it "should be successful" do
                         Exam.should_receive(:new).and_return(@exam_mock)
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:unpublished).and_return([@exam_mock])
                         Type.should_receive(:all).and_return([@type_mock])

                         get 'new', :course_id => @course_id

                         assigns(:exam).should == @exam_mock
                         assigns(:exams).should == [@exam_mock]
                         assigns(:types).should == [@type_mock]
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

          describe "redirect or render" do

               describe "#show" do

                    it "should redirect to index if not found with wanted id" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:published).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(nil)

                         get 'show', :course_id => @course_id, :id => 1

                         response.should redirect_to(course_exams_url(@course_id))
                    end

                    it "should render json if so requested" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:to_public)

                         get 'show', :course_id => @course_id, :id => 1, :format => 'json'

                    end

                    it "should redirect to index if not found with wanted id pdf" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:published).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(nil)

                         get 'show', :course_id => @course_id, :id => 1, :format => 'pdf'

                         response.should redirect_to(course_exams_url(@course_id))
                    end

                    it "should format pdf from given exam id" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @course_mock.should_receive(:name).and_return("foo")
                         @exams_mock.should_receive(:published).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:name).and_return("bar")
                         PdfExport.should_receive(:exam).with(@exam_mock).and_return(nil)
                         controller.should_receive(:send_data).with(nil, :filename => "foo - bar.pdf").and_return(nil)

                         get 'show', :course_id => @course_id, :id => 1, :format => "pdf"
                    end

               end

               describe "#edit" do

                    it "should redirect to show if tries to edit published exam" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(@exam_mock)
                         @exam_mock.should_receive(:published).and_return(true)
                         @exam_mock.stub!(:id).and_return(1)

                         get 'edit', :course_id => @course_id, :id => 1

                         response.should redirect_to(course_exam_url(@course_id, 1))
                    end

                    it "should redirect to show if tries to edit nil exam" do
                         @course_mock.should_receive(:exams).and_return(@exams_mock)
                         @exams_mock.should_receive(:find_by_id).with('1').and_return(nil)

                         get 'edit', :course_id => @course_id, :id => 1

                         response.should redirect_to(new_course_exam_url(@course_id))
                    end

               end

          end

     end

     describe "POST" do

          before :each do
               @course_mock.stub!(:id).and_return(@course_id)
               @exam_id = '1'
               @exam_mock.stub!(:id).and_return(@exam_id)
          end

          describe "#create" do

               it "should confirm old data and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
                    @exam_mock.should_receive(:id).and_return(@exam_id)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    post 'create', :course_id => @course_id, :exam => {:id => @exam_id}
                    response.should redirect_to(edit_course_exam_url(@course_id, @exam_id))
               end

               it "should be redirected back to new page if missing attributes." do
                    post 'create', :course_id => @course_id
                    response.should redirect_to(new_course_exam_url(@course_id))
               end

               it "should be redirected back to new page if invalid attributes." do
                    @errors = []
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(true)
                    @exam_mock.should_receive(:errors).and_return(@errors)
                    @errors.should_receive(:full_messages).and_return([])
                    post 'create', :course_id => @course_id, :exam => {:type_id => '1', :date => Date.today}
                    flash[:errors].should == []
                    response.should redirect_to(new_course_exam_url(@course_id))
               end

               it "should save new data (id return nil) and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).twice.and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(nil)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    @exam_mock.stub!(:id).and_return(2)
                    post 'create', :course_id => @course_id, :exam => {:id => @exam_id}
                    response.should redirect_to(edit_course_exam_url(@course_id, @exam_mock.id))
               end

               it "should save new data (id isn't set) and be redirected to edit exam url" do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_not_receive(:find_by_id)
                    @exams_mock.should_receive(:create).and_return(@exam_mock)
                    @exam_mock.should_receive(:new_record?).and_return(false)
                    @exam_mock.stub!(:id).and_return(3)
                    post 'create', :course_id => @course_id, :exam => {:type_id => '1', :date => Date.today, :maximum_points => '60'}
                    response.should redirect_to(edit_course_exam_url(@course_id, @exam_mock.id))
               end

          end

          describe "#update" do

               it "should preview the exam" do
                    @exam_id = '1'
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
                    @exam_mock.should_receive(:questions).and_return(@question_mock)

                    put 'update', :course_id => @course_id, :id => @exam_id

                    assigns(:exam).should == @exam_mock
                    assigns(:questions).should == @question_mock
                    assigns(:course).should == @course_mock

                    response.should be_success
               end

          end

          describe "#publish" do

               it "should publish the exam" do
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
                    @exam_mock.should_receive(:publish!).and_return(true)

                    post 'publish', :course_id => @course_id, :id => @exam_id

                    response.should redirect_to(course_exam_url(@course_id, @exam_id))
               end

               it "should redirect the unfinished exam" do
                    @errors = []
                    @course_mock.should_receive(:exams).and_return(@exams_mock)
                    @exams_mock.should_receive(:unpublished).and_return(@exams_mock)
                    @exams_mock.should_receive(:find_by_id).with(@exam_id).and_return(@exam_mock)
                    @exam_mock.should_receive(:publish!).and_return(false)
                    @exam_mock.should_receive(:valid?)
                    @exam_mock.should_receive(:errors).and_return(@errors)
                    @errors.should_receive(:full_messages).and_return([])

                    post 'publish', :course_id => @course_id, :id => @exam_id

                    flash[:errors].should == []
                    response.should redirect_to(edit_course_exam_url(@course_id, @exam_id))
               end

          end

     end

end

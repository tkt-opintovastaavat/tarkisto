require 'spec_helper'

describe ExamsHelper do
     include ExamsHelper

     it "should be included in the object returned by #helper" do
          included_modules = (class << helper; self; end).send :included_modules
          included_modules.should include(ExamsHelper)
     end

     describe "#exam_selection" do

          it "should return list of exams" do
               exam_mock = mock_model Exam do |exam|
                    exam.stub!(:name).and_return "Seperate exam 01.01.2010"
                    exam.stub!(:id).and_return "1"
               end
               exams = [exam_mock]
               exam_selection(exams).should include(["Seperate exam 01.01.2010", "1"])
               exam_selection(exams).should include([t('pages.exams.forms.selection.new'), "new"])
          end

     end

     describe "#type_selection" do

          it "should return list of exam types" do
               type_mock = mock_model Type do |etype|
                    etype.stub!(:name).and_return "Seperate exam"
                    etype.stub!(:id).and_return "1"
               end
               types = [type_mock]
               type_selection(types).should include(["Seperate exam", "1"])
          end

     end

end

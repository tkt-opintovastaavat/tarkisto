require 'spec_helper'

describe PdfExport do

     describe "own PDF::Writer extension" do

          it "should work with unicode" do
               pdf = PDF::Writer.new
               pdf.should_receive(:old_text).with("test", {})
               pdf.text("test", {})
          end

     end

     describe "#exam" do

          before(:each) do
               @course_mock = mock_model Course
               @exam_mock = mock_model Exam
               @question_mock = mock_model Question
               @questions_mock = [@question_mock]
               @pdf_writer_mock = mock PDF::Writer
          end

          it 'should print school data to file' do
               5.times do
                    @pdf_writer_mock.should_receive(:text)
               end
               @exam_mock.should_receive(:course).twice.and_return(@course_mock)
               @course_mock.should_receive(:name).and_return("foo")
               @course_mock.should_receive(:code).and_return("bar")
               @exam_mock.should_receive(:name).and_return("FUU")
               @exam_mock.should_receive(:maximum_points).and_return("FUU")
               PdfExport.school_data(@exam_mock, @pdf_writer_mock)
          end

          it 'should write questions to file' do
               @exam_mock.should_receive(:questions).and_return(@questions_mock)
               #@questions_mock.should_receive(:each).and_return(@question_mock)
               @question_mock.should_receive(:number)
               @question_mock.should_receive(:name)
               @question_mock.should_receive(:description)
               @question_mock.should_receive(:points)
               3.times do
                    @pdf_writer_mock.should_receive(:text)
               end
               
               PdfExport.question_format(@exam_mock, @pdf_writer_mock)
          end

          it 'should output an exam as file' do
               PDF::Writer.should_receive(:new).and_return(@pdf_writer_mock)
               @pdf_writer_mock.should_receive(:select_font)
               @pdf_writer_mock.should_receive(:font_size=)
               @pdf_writer_mock.should_receive(:right_margin=)
               @pdf_writer_mock.should_receive(:left_margin=)
               PdfExport.should_receive(:school_data).and_return(true)
               PdfExport.should_receive(:question_format).and_return(true)
               @pdf_writer_mock.should_receive(:render)
               PdfExport.exam(@exam_mock)
          end

     end
     
end

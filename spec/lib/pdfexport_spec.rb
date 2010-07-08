require 'spec_helper'

describe PdfExport do
     before(:each) do
          @course_mock = mock_model Course
          @exam_mock = mock_model Exam
          @question_mock = mock_model Question
          @questions_mock = [@question_mock]
          @pdf_writer_mock = mock PDF::Writer
     end

     describe "#exam" do
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
               @questions_mock.should_receive(:each).and_return(@question_mock)
               
               PdfExport.question_format(@exam_mock, @pdf_writer_mock)
          end
          it 'should output an exam as file' do
               PdfExport.should_receive(:exam).with(@exam_mock)

               PdfExport.exam(@exam_mock)
          end
     end
     
end

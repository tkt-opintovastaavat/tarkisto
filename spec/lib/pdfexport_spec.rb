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

    describe "#question_format" do

      before(:each) do
        @image_mock = mock_model Image
        @code_mock = mock_model CodeSnippet
        @paperclip_mock = mock Paperclip

        # basic questions handling
        @exam_mock.should_receive(:questions).and_return(@questions_mock)

        # basic question information
        @question_mock.should_receive(:number)
        @question_mock.should_receive(:name)
        @pdf_writer_mock.should_receive(:text) # this writes question number and name
      end

      after(:each) do
        # question points handling
        @question_mock.should_receive(:points)
        @pdf_writer_mock.should_receive(:text) # this writes question points

        PdfExport.question_format(@exam_mock, @pdf_writer_mock)
      end

      it 'should write questions without any objects to file' do
        # early attachment handling
        @question_mock.should_receive(:images).and_return([]) # no images
        @question_mock.should_receive(:code_snippets).and_return([]) # no code snippets

        # question description handling
        @question_mock.should_receive(:description).twice.and_return("LOL")
        @pdf_writer_mock.should_receive(:text) # this writes question description
      end

      it 'should write questions with attachments to file' do
        # early attachment handling
        @question_mock.should_receive(:images).and_return([@image_mock])
        @question_mock.should_receive(:code_snippets).and_return([@code_mock])

        # question description handling
        @question_mock.should_receive(:description).twice.and_return("LOL")
        @pdf_writer_mock.should_receive(:text) # this writes question description

        # attachments handling
        ## image
        @image_mock.should_receive(:question_image).and_return(@paperclip_mock)
        @paperclip_mock.should_receive(:path)
        @pdf_writer_mock.should_receive(:image)
        ## code
        @code_mock.should_receive(:text)
        @pdf_writer_mock.should_receive(:text)
      end

      it 'should write questions without attachments to file' do
        # early attachment handling
        @question_mock.should_receive(:images).twice.and_return([@image_mock])
        @question_mock.should_receive(:code_snippets).twice.and_return([@code_mock])

        # question description handling
        @question_mock.should_receive(:description).twice.and_return("LOL<[i#1]>TROLL<[c#1]>FU-")
        @pdf_writer_mock.should_receive(:text) # this writes LOL
        @image_mock.should_receive(:question_image).and_return(@paperclip_mock)
        @paperclip_mock.should_receive(:path)
        @pdf_writer_mock.should_receive(:image)
        @pdf_writer_mock.should_receive(:text) # this writes TROLL
        @code_mock.should_receive(:text)
        @pdf_writer_mock.should_receive(:text)
        @pdf_writer_mock.should_receive(:text) # this writes FU-
      end

      it 'should write questions without attachments and text to file' do
        # early attachment handling
        @question_mock.should_receive(:images).twice.and_return([@image_mock])
        @question_mock.should_receive(:code_snippets).and_return([])

        # question description handling
        @question_mock.should_receive(:description).twice.and_return("<[i#1]>")
        @pdf_writer_mock.should_receive(:text) # this writes empty string
        @image_mock.should_receive(:question_image).and_return(@paperclip_mock)
        @paperclip_mock.should_receive(:path)
        @pdf_writer_mock.should_receive(:image)
      end

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

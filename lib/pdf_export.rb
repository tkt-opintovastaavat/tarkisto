module PdfExport
     require 'pdf/writer'
     require 'pdf_export_utf8_extension'

     def self.school_data(exam, pdf)
          pdf.text(I18n.t'pdf.school.name')
          pdf.text(I18n.t'pdf.school.department')
          pdf.text("#{exam.course.name} #{exam.course.code}")
          pdf.text("#{exam.name}")
          pdf.text("#{I18n.t'pdf.exam.max_points'}: #{exam.maximum_points}")
     end

     def self.question_format(exam, pdf)
          exam.questions.each do |question|
               pdf.text("\n#{question.number}. #{question.name}", :font_size => 10)
               pdf.text("\n#{question.description}", :left => 30, :font_size => 8)
               pdf.text("(#{question.points} #{I18n.t'pdf.exam.points'})", :justification => :center, :font_size => 8)
          end
     end
  
     def self.exam(exam)

          pdf = PDF::Writer.new(:paper => "A4")
          pdf.select_font "Helvetica"
          pdf.font_size = 10
          pdf.right_margin = 100
          pdf.left_margin = 50

          school_data(exam, pdf)
          question_format(exam, pdf)

          pdf.render

     end

end

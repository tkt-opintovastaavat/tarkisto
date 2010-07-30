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
               filter = /<\[[ci]#[0-9]+\]>/
               attach = /<\[([ci])#([0-9]+)\]>/
               texts = question.description.split(filter)
               objects = question.description.scan(filter).map do |object|
                    object = object.split(attach)
                    if object[1] == 'i'
                         question.images[object[2].to_i-1]
                    else
                         question.code_snippets[object[2].to_i-1]
                    end
               end

               texts << "" if texts.empty?

               texts.each do |str|
                    pdf.text str, :left => 30, :font_size => 8
                    unless objects.empty?
                         object = objects.shift
                         if object.instance_of? Image
                              pdf.image object.question_image.url( :pdf )
                         else
                              pdf.text object.text
                         end
                    end
               end
               #pdf.text("\n#{question.description}", :left => 30, :font_size => 8)

               #question.code_snippets.each do |code|
               #     pdf.text code.text
               #end
               #question.images.each do |image|
               #     pdf.image image.question_image.url( :pdf )
               #end

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

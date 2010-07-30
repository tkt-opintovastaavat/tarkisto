class Image < ActiveRecord::Base
     belongs_to :question
     has_attached_file :question_image, :styles => { :pdf => ["2480x3508>", :jpg], :web => ["595x842>", :jpg]}, :path => ":rails_root/public/:attachment/:id/:style_:basename.:extension", :url => ":rails_root/public/:attachment/:id/:style_:basename.:extension"
     
     validates_attachment_presence :question_image
     validates_attachment_content_type :question_image, :content_type => ["image/jpeg", "image/pjpeg", "image/gif", "image/png", "image/x-png", "image/jpg"]
end

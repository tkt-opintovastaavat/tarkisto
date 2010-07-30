class Image < ActiveRecord::Base
     belongs_to :question
     has_attached_file :question_image, :styles => { :medium => "600x600", :thumb => "100x100" }, :path => ":rails_root/public/:attachment/:id/:style_:basename.:extension"
     
     validates_attachment_presence :question_image
     validates_attachment_content_type :question_image, :content_type => /image/
end

class Image < ActiveRecord::Base
     belongs_to :question
     has_attached_file :picture, :styles => { :medium => "600x600", :thumb => "100x100" }
     
     validates_attachment_presence :picture
     validates_attachment_content_type :picture, :content_type => /image/
end

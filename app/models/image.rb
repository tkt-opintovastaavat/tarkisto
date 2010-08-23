require 'open-uri'

class Image < ActiveRecord::Base

     belongs_to :question

     has_attached_file :question_image, :styles => { :medium => "600x600", :thumb => "100x100" }, :path => ":rails_root/public/:attachment/:id/:style_:basename.:extension"

     attr_accessor :image_url

     before_validation :download_remote_image, :if => :image_url_provided?
     has_attached_file :question_image, :styles => { :pdf => ["2480x3508>", :jpg], :web => ["595x842>", :jpg]}, :path => ":rails_root/public/:attachment/:id/:style.:extension", :url => ":rails_root/public/:attachment/:id/:style_:basename.:extension"
     #has_attached_file :question_image, :styles => { :web => "600x600>"}, :path => ":rails_root/public/:attachment/:id/:style_:basename.:extension", :url => ":rails_root/public/:attachment/:id/:style_:basename.:extension"
     validates_attachment_content_type :question_image, :content_type => /image/
     #validates_attachment_content_type :question_image, :content_type => ["image/jpeg", "image/pjpeg", "image/gif", "image/png", "image/x-png", "image/jpg"]

     private

     def image_url_provided?
          !self.image_url.blank?
     end

     def download_remote_image
          self.question_image = do_download_remote_image
     end

     def do_download_remote_image
          io = open(URI.parse(image_url))
          def io.original_filename; base_uri.path.split('/').last; end
          io.original_filename.blank? ? nil : io
     rescue # catch url errors with validations instead of exceptions (Errno::ENOENT, OpenURI::HTTPError, etc...)
     end

end

require 'open-uri'

class Image < ActiveRecord::Base

  belongs_to :question


  attr_accessor :image_url

  before_validation :download_remote_image, :if => :image_url_provided?

  has_attached_file :question_image,
    :styles => {
      :pdf => ["2480x3508>", :jpg],
      :web => ["595x842>", :jpg],
      :medium => ["600x600", :jpg],
      :thumb => ["100x100", :jpg]
    },
    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
    :url => "/:attachment/:id/:style.:extension"

  validates_attachment_content_type :question_image, :content_type => /image/

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

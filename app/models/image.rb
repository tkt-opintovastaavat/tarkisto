require 'open-uri'

class Image < ActiveRecord::Base

  belongs_to :question

  mount_uploader :file, ImageUploader

end

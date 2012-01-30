# encoding: utf-8

class ImageUploader < CarrierWave::Uploader::Base

  include CarrierWave::RMagick

  storage :file

  def store_dir
    "system/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process :convert => 'jpg'

  version :pdf do
    process :resize_to_fill => [2480, 3508]
  end

  version :web do
    process :resize_to_fill => [595, 842]
  end

  version :medium do
    process :resize_to_fill => [600, 600]
  end

  version :thumb do
    process :resize_to_fill => [100, 100]
  end

  def extension_white_list
    %w(jpg jpeg gif png)
  end

  def filename
    "tarkisto.jpg" if original_filename
  end

end

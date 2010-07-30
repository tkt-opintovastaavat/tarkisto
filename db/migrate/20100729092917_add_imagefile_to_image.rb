class AddImagefileToImage < ActiveRecord::Migration
  def self.up
     add_column :images, :question_image_file_name,    :string
     add_column :images, :question_image_content_type, :string
     add_column :images, :question_image_file_size,    :integer
     remove_column :images, :image_path
  end

  def self.down
     remove_column :images, :question_image_file_name,    :string
     remove_column :images, :question_image_content_type, :string
     remove_column :images, :question_image_file_size,    :integer
     add_column :images, :image_path
  end
end

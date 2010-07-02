class Image < ActiveRecord::Base
     belongs_to :question
     
     validates_presence_of :image_path
end

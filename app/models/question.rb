class Question < ActiveRecord::Base
     belongs_to :exam
     has_many :code_snippets
     has_many :images
     
     validates_presence_of :number, :name, :points, :description
end

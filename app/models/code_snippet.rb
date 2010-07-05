class CodeSnippet < ActiveRecord::Base
     belongs_to :question
     
     validates_presence_of :text
end

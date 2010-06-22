class Level < ActiveRecord::Base
     has_many :courses

     validates_presence_of :name_fi
end

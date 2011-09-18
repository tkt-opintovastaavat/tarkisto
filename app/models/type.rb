class Type < ActiveRecord::Base
  include LocalizeName

  has_many :exams

  validates_presence_of :name_fi

end

class Shortcut < ActiveRecord::Base
  belongs_to :course

  validates_presence_of :name
end

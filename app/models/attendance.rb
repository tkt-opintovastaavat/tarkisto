class Attendance < ActiveRecord::Base
  belongs_to :instances
  belongs_to :users
end

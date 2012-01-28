class Instance < ActiveRecord::Base

  belongs_to :course
  has_many :attendances

  # periodi olis hyvä olla pakollinen, mutta kun se ei ole "kurki-kannassa"
  validates_presence_of :year, :semester

  named_scope :on_semester, lambda { |year, semester|
    { :conditions => { :year => year, :semester => semester} }
  }

end

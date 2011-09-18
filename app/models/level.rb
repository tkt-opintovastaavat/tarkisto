class Level < ActiveRecord::Base
  include LocalizeName

  has_many :courses

  validates_presence_of :name_fi

  def self.basic_studies
    self.find_by_name_fi("Perusopinnot")
  end

  def self.intermediate_studies
    self.find_by_name_fi("Aineopinnot")
  end

  def self.advanced_studies
    self.find_by_name_fi("Syventävät opinnot")
  end

  def self.other_studies
    self.find_by_name_fi("Muut opinnot")
  end

end

class Level < ActiveRecord::Base
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

  def name
    if (I18n.locale == :fi)
      return name_fi
    elsif (I18n.locale == :en)
      return name_en
    elsif (I18n.locale == :se)
      return name_se
    end
  end

end

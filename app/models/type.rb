class Type < ActiveRecord::Base
  include LocalizeName

  has_many :exams

  validates_presence_of :name_fi
  validates_uniqueness_of :name_fi

  def self.course_exams
    self.find_by_name_fi('Kurssikoe')
  end

  def self.renewal_exams
    self.find_by_name_fi('Uusintakoe')
  end

  def self.separate_exams
    self.find_by_name_fi('Erilliskoe')
  end

  def self.generated_exams
    self.find_by_name_fi("Generoitu koe")
  end

end

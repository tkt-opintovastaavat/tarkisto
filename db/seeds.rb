# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
     perusopinnot = CourseLevel.create :name => 'Perusopinnot'
     aineopinnot = CourseLevel.create :name => 'Aineopinnot'
     syventävätopinnot = CourseLevel.create :name => 'Syventävät opinnot'
     muutopinnot = CourseLevel.create :name => 'Muut opinnot'

     erilliskoe = ExamType.create :name => 'Erilliskoe'
     kurssikoe = ExamType.create :name => 'Kurssikoe'
     uusintakoe = ExamType.create :name => 'Uusintakoe'     

     ohpe = perusopinnot.courses.create :code => 581325, :name => 'Ohjelmoinnin perusteet', :credits => 5
     lama = aineopinnot.courses.create :code => 582206, :name => 'Laskennan mallit', :credits => 6
     bipe = syventävätopinnot.courses.create :code => 582313, :name => 'Bioinformatiikan perusteet', :credits => 4
     dima = muutopinnot.courses.create :code => 57049, :name => 'Johdatus diskreettiin matematiikkaan', :credits => 5

     ohpe.exams.create :exam_type => kurssikoe, :public => true, :date => Date.new(2010, 6, 12), :maximum_points => 50
     ohpe.exams.create :exam_type => erilliskoe, :date => Date.new(2010, 6, 1), :maximum_points => 60
     ohpe.exams.create :exam_type => uusintakoe, :public => true, :date => Date.new(2010, 8, 30), :maximum_points => 50

     lama.exams.create :exam_type => erilliskoe, :date => Date.new(2010, 6, 4), :maximum_points => 60
     lama.exams.create :exam_type => kurssikoe, :date => Date.new(2009, 10 , 22), :maximum_points => 60
     lama.exams.create :exam_type => uusintakoe, :date => Date.new(2010, 1, 22), :maximum_points => 60

     bipe.exams.create :exam_type => kurssikoe, :date => Date.new(2009, 10, 21), :maximum_points => 60

     dima.exams.create :exam_type => kurssikoe, :date => Date.new(2009, 12, 18), :maximum_points => 24
     dima.exams.create :exam_type => erilliskoe, :date => Date.new(2010, 8, 12), :maximum_points => 24

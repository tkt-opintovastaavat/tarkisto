# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#   
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Major.create(:name => 'Daley', :city => cities.first)
     perusopinnot = Level.create :name_fi => 'Perusopinnot'
     aineopinnot = Level.create :name_fi => 'Aineopinnot'
     syventävätopinnot = Level.create :name_fi => 'Syventävät opinnot'
     muutopinnot = Level.create :name_fi => 'Muut opinnot'

     erilliskoe = Type.create :name_fi => 'Erilliskoe'
     kurssikoe = Type.create :name_fi => 'Kurssikoe'
     uusintakoe = Type.create :name_fi => 'Uusintakoe'   
     generoitu_koe = Type.create :name_fi => 'Generoitu koe'     

     ohpe = perusopinnot.courses.create :code => 581325 , :name_fi => 'Ohjelmoinnin perusteet', :credits => 5
     lama = aineopinnot.courses.create :code => 582206 , :name_fi => 'Laskennan mallit', :credits => 6
     bipe = syventävätopinnot.courses.create :code => 582313 , :name_fi => 'Bioinformatiikan perusteet', :credits => 4
     dima = muutopinnot.courses.create :code => 57049 , :name_fi => 'Johdatus diskreettiin matematiikkaan', :credits => 5

     ohpe.exams.create :lecturer => 'Arto Wikla', :type_id => kurssikoe.id, :public => true, :date => Date.new(2010, 6, 12), :maximum_points => 50
     ohpe.exams.create :lecturer => 'Luukkainen', :type_id => erilliskoe.id, :date => Date.new(2010, 6, 1), :maximum_points => 60
     ohpe.exams.create :lecturer => 'Arto Wikla', :type_id => uusintakoe.id, :public => true, :date => Date.new(2010, 8, 30), :maximum_points => 50

     lama.exams.create :lecturer => 'Kärkkäinen', :type_id => erilliskoe.id , :date => Date.new(2010, 6, 4), :maximum_points => 60
     lama.exams.create :lecturer => 'Kärkkäinen', :type_id => kurssikoe.id , :date => Date.new(2009, 10 , 22), :maximum_points => 60
     lama.exams.create :lecturer => 'Kärkkäinen', :type_id => uusintakoe.id , :date => Date.new(2010, 1, 22), :maximum_points => 60

     bipe.exams.create :lecturer => 'Sirkka-Liisa Varvio', :type_id => kurssikoe.id , :date => Date.new(2009, 10, 21), :maximum_points => 60

     dima.exams.create :lecturer => 'Petteri Harjulehto', :type_id => kurssikoe.id , :date => Date.new(2009, 12, 18), :maximum_points => 24
     dima.exams.create :lecturer => 'Petteri Harjulehto', :type_id => erilliskoe.id , :date => Date.new(2010, 8, 12), :maximum_points => 24

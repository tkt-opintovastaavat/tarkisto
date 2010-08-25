#DURR
require 'rubygems'
require 'oci8'



File.open("seeds.rb", 'w') do |f|
     f.puts("peru = Level.create :name_fi => 'Perusopinnot'");
     f.puts("aine = Level.create :name_fi => 'Aineopinnot'");
     f.puts("syve = Level.create :name_fi => 'Syventävät opinnot'");
     f.puts("muut = Level.create :name_fi => 'Muut opinnot'");
     
     conn = OCI8.new('tarkisto', ARGV.first, 'bodbacka/test')

     jaksot = conn.exec("select kurssikoodi, nimi_suomi, nimi_ruotsi, nimi_englanti, opintopisteet, taso from opintojakso where tyyppi = 'K' and opintopisteet != 0")

     while oj = jaksot.fetch
          kk = oj[0] #kurssikoodi
          nimis = oj[1] #nimi_suomi
          nimir = oj[2] #nimi_ruotsi
          nimie = oj[3] #nimi_englanti
          op = oj[4] #opintopisteet
          taso = oj[5] #taso

          if kk == 99501
               puts oj[2]
          end

          if taso == 'A'
                f.puts(%&peru.courses.create :code => #{kk}, :name_fi => \"#{nimis}\", :name_se => \"#{nimir}\", :name_en => \"#{nimie}\",  :credits => #{op}&.gsub(/\n/, ''))
          elsif taso == 'C'
                f.puts(%&aine.courses.create :code => #{kk}, :name_fi => \"#{nimis}\", :name_se => \"#{nimir}\", :name_en => \"#{nimie}\",  :credits => #{op}&.gsub(/\n/, ''))
          elsif taso == 'L'
                f.puts(%&syve.courses.create :code => #{kk}, :name_fi => \"#{nimis}\", :name_se => \"#{nimir}\", :name_en => \"#{nimie}\",  :credits => #{op}&.gsub(/\n/, ''))
          else
                f.puts(%&muut.courses.create :code => #{kk}, :name_fi => \"#{nimis}\", :name_se => \"#{nimir}\", :name_en => \"#{nimie}\",  :credits => #{op}&.gsub(/\n/, ''))
          end

     end

     File.open("examseeds.rb", 'r') do |s|
          while line = s.gets
               f.puts(line)
          end
     end
end

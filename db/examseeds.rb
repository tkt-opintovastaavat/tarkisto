     perusopinnot = Level.create :name_fi => 'Perusopinnot'
     aineopinnot = Level.create :name_fi => 'Aineopinnot'
     syventävätopinnot = Level.create :name_fi => 'Syventävät opinnot'
     muutopinnot = Level.create :name_fi => 'Muut opinnot'

     erilliskoe = Type.create :name_fi => 'Erilliskoe'
     kurssikoe = Type.create :name_fi => 'Kurssikoe'
     uusintakoe = Type.create :name_fi => 'Uusintakoe'     

     kesa = Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => kurssikoe.id, :public => true, :date => Date.new(2010, 6, 12), :maximum_points => 50, :language => 'fi'
     Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => erilliskoe.id, :date => Date.new(2010, 6, 1), :maximum_points => 60
     Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => uusintakoe.id, :public => true, :date => Date.new(2010, 8, 30), :maximum_points => 50

     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => erilliskoe.id , :date => Date.new(2010, 6, 4), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => kurssikoe.id , :date => Date.new(2009, 10 , 22), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => uusintakoe.id , :date => Date.new(2010, 1, 22), :maximum_points => 60

     Course.find_by_code(582313).exams.create :lecturer => 4, :type_id => kurssikoe.id , :date => Date.new(2009, 10, 21), :maximum_points => 60

     kesa.question.create :number => 1 , :name => %&Selitä lyhyesti ja selkeästi käsitteet parametri, konstruktori, aksessori, kapselointi&, :description => "", :points => 16
     kesa.question.create :number => 2 , :description => %&* public OliiviOljyAsema (double pääsailiö, double varastosailio) luo oliiviöljyaseman, jonka säiliöiden vetoisuudet annetaan parametreina. Jos vetoisuus on virheellinen, säiliön kooksi asetetaan 100 litraa. Molemmat säiliöt ovat aluksi tyhjiä.

    * public double getPaa() palauttaa tiedon pääsäiliön öljymäärästä
    * public double getVara() palauttaa tiedon varastosäiliön öljymäärästä
    * public double getYht() palauttaa tiedon aseman koko öljymäärästä

    * public boolean lisaaOljya(double maara) lisää öljyä pääsäiliöön. Jos yritetään lisätä enemmän kuin pääsäiliöön mahtuu, ylimääräinen öljy pumpataan varastosäiliöön. Jos koko lisättävä määrä ei mahtu säiliöihin, öljyn määrää kummassakaan säiliössä ei muuteta. Metodi palauttaa arvon true, jos lisäys onnistui, muuten false.

    * public double otaOljya(double maara) ottaa öljyä pääsäiliöstä. Jos pyydetään enemmän kuin pääsäiliössä on, öljyä siirretään automaattisesti varastosäiliöstä pääsäiliöön. Jos edes molempien säiliöiden öljy ei riitä, annetaan mitä voidaan. Metodi palauttaa arvonaan saadun öljyn määrän.

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen oliiviöljyaseman tilasta 

Havainnollista OliiviOljyAsema-luokan käyttöä pienellä pääohjelmalla. Tämän ohjelman ei tarvitse eikä ole syytä lukea mitään.&, :name => %&Oliiviöljyasemalla on kaksi öljysäiliötä. Vain pääsäiliöön voidaan suoraan lisätä öljyä ja vain pääsäiliöstä asiakas voi tankata öljyä. Toinen säiliö on varastosäiliö, jota käytetään automaattisesti hyväksi, kun ensimmäisen säiliön kapasiteetti ei riitä. Laadi luokka OliiviOljyAsema oliiviöljyaseman toteutukseksi.&, :points => 17
     kesa.question.create :number => 3 , :description => %&Ennen pelin alkua pelinjohtaja syöttää ohjelmalle sata kokonaislukua satunnaisessa järjestyksessä.  Luvut saavat olla mitä tahansa kokonaislukuja. Sama luku saa esiintyä useammankin kerran.

Tämän jälkeen pelaaja alkaa käyttää ohjelmaa. Pelaaja yrittää arvata pelinjohtajan koneeseen syöttämiä lukuja. Peli päättyy, kun pelaaja onnistuu arvaamaan jonkin pelinjohtajan syöttämän luvun. Pelin tulos on tarvittujen arvausten määrä, jonka ohjelma lopuksi tulostaa.

Saat olettaa, että kaikki syötetyt luvut ovat kelvollisia kokonaislukuja.

Arvattavien lukujen hakeminen on tehokkuussyistä ohjelmoitava binäärihakua käyttäen. &, :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena ohjelmana:&, :points => 17

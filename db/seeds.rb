# Levels
basic_studies = Level.create :name_fi => 'Perusopinnot'
intermediate_studies = Level.create :name_fi => 'Aineopinnot'
advanced_studies = Level.create :name_fi => 'Syventävät opinnot'
other_studies = Level.create :name_fi => 'Muut opinnot'

# Exam types
separate_exams = Type.create :name_fi => 'Erilliskoe'
course_exams = Type.create :name_fi => 'Kurssikoe'
renewal_exams = Type.create :name_fi => 'Uusintakoe'
generated_exams = Type.create :name_fi => 'Generoitu koe'

courses = KURLI.perform rescue []

courses.each do |course|
  level = nil
  if course.basic?
    level = basic_studies
  elsif course.intermediate?
    level = intermediate_studies
  elsif course.advanced?
    level = advanced_studies
  else
    level = other_studies
  end
  level.courses.create! :code => course.code,
    :name_fi => course.name(:fi),
    :name_se => course.name(:se),
    :name_en => course.name(:en),
    :credits => course.credits
end

# Themes

algorithm_theme = Theme.create :name_fi => 'Algoritmit ja ohjausrakenteet'
variable_theme = Theme.create :name_fi => 'Muuttujat ja tyypit'
subroutines_theme = Theme.create :name_fi => 'Aliohjelmat'
class_theme = Theme.create :name_fi => 'Luokat'
objects_theme = Theme.create :name_fi => 'Oliot ja kapselointi'

alg = algorithm_theme.course_themes.create :course_id => Course.find_by_code(581325).id
var = variable_theme.course_themes.create :course_id => Course.find_by_code(581325).id
sub = subroutines_theme.course_themes.create :course_id => Course.find_by_code(581325).id
classes = class_theme.course_themes.create :course_id => Course.find_by_code(581325).id
objects = objects_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     kesa = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => course_exams.id, :date => Date.new(2010, 6, 12), :maximum_points => 50, :language => 'fi'
     Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => separate_exams.id, :date => Date.new(2010, 6, 1), :maximum_points => 60
     Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => renewal_exams.id, :date => Date.new(2010, 8, 30), :maximum_points => 50

     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => separate_exams.id , :date => Date.new(2010, 6, 4), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => course_exams.id , :date => Date.new(2009, 10 , 22), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => renewal_exams.id , :date => Date.new(2010, 1, 22), :maximum_points => 60

     Course.find_by_code(582313).exams.create :lecturer => 4, :type_id => course_exams.id , :date => Date.new(2009, 10, 21), :maximum_points => 60

     Course.find_by_code(581325).instances.create :period => 1, :year => 2010, :semester => 'S'
     Course.find_by_code(581328).instances.create :period => 1, :year => 2010, :semester => 'S'
     Course.find_by_code(582104).instances.create :period => 2, :year => 2010, :semester => 'S'
     Course.find_by_code(582206).instances.create :period => 1, :year => 2010, :semester => 'S'
     Course.find_by_code(582497).instances.create :period => 1, :year => 2010, :semester => 'S'
     Course.find_by_code(582103).instances.create :period => 3, :year => 2011, :semester => 'S'

     kesa.questions.create :number => 1 , :name => %&Selitä lyhyesti ja selkeästi käsitteet parametri, konstruktori, aksessori, kapselointi&, :description => "", :points => 16

     kesa.questions.last.course_theme_questions.create :course_theme => objects
     kesa.questions.last.course_theme_questions.create :course_theme => var

     kesa.questions.create :number => 2 , :description => %&* public OliiviOljyAsema (double pääsailiö, double varastosailio) luo oliiviöljyaseman, jonka säiliöiden vetoisuudet annetaan parametreina. Jos vetoisuus on virheellinen, säiliön kooksi asetetaan 100 litraa. Molemmat säiliöt ovat aluksi tyhjiä.

    * public double getPaa() palauttaa tiedon pääsäiliön öljymäärästä
    * public double getVara() palauttaa tiedon varastosäiliön öljymäärästä
    * public double getYht() palauttaa tiedon aseman koko öljymäärästä

    * public boolean lisaaOljya(double maara) lisää öljyä pääsäiliöön. Jos yritetään lisätä enemmän kuin pääsäiliöön mahtuu, ylimääräinen öljy pumpataan varastosäiliöön. Jos koko lisättävä määrä ei mahtu säiliöihin, öljyn määrää kummassakaan säiliössä ei muuteta. Metodi palauttaa arvon true, jos lisäys onnistui, muuten false.

    * public double otaOljya(double maara) ottaa öljyä pääsäiliöstä. Jos pyydetään enemmän kuin pääsäiliössä on, öljyä siirretään automaattisesti varastosäiliöstä pääsäiliöön. Jos edes molempien säiliöiden öljy ei riitä, annetaan mitä voidaan. Metodi palauttaa arvonaan saadun öljyn määrän.

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen oliiviöljyaseman tilasta

Havainnollista OliiviOljyAsema-luokan käyttöä pienellä pääohjelmalla. Tämän ohjelman ei tarvitse eikä ole syytä lukea mitään.&, :name => %&Oliiviöljyasemalla on kaksi öljysäiliötä. Vain pääsäiliöön voidaan suoraan lisätä öljyä ja vain pääsäiliöstä asiakas voi tankata öljyä. Toinen säiliö on varastosäiliö, jota käytetään automaattisesti hyväksi, kun ensimmäisen säiliön kapasiteetti ei riitä. Laadi luokka OliiviOljyAsema oliiviöljyaseman toteutukseksi.&, :points => 17

     kesa.questions.last.course_theme_questions.create! :course_theme => objects
     kesa.questions.last.course_theme_questions.create! :course_theme => classes
     kesa.questions.last.course_theme_questions.create! :course_theme => alg
     kesa.questions.last.course_theme_questions.create! :course_theme => var
     kesa.questions.last.course_theme_questions.create! :course_theme => sub


     kesa.questions.create :number => 3 , :description => %&Ennen pelin alkua pelinjohtaja syöttää ohjelmalle sata kokonaislukua satunnaisessa järjestyksessä.  Luvut saavat olla mitä tahansa kokonaislukuja. Sama luku saa esiintyä useammankin kerran.

Tämän jälkeen pelaaja alkaa käyttää ohjelmaa. Pelaaja yrittää arvata pelinjohtajan koneeseen syöttämiä lukuja. Peli päättyy, kun pelaaja onnistuu arvaamaan jonkin pelinjohtajan syöttämän luvun. Pelin tulos on tarvittujen arvausten määrä, jonka ohjelma lopuksi tulostaa.

Saat olettaa, että kaikki syötetyt luvut ovat kelvollisia kokonaislukuja.

Arvattavien lukujen hakeminen on tehokkuussyistä ohjelmoitava binäärihakua käyttäen. &, :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena ohjelmana:&, :points => 17

     kesa.questions.last.course_theme_questions.create! :course_theme => alg
     kesa.questions.last.course_theme_questions.create! :course_theme => sub
     kesa.questions.last.course_theme_questions.create! :course_theme => classes
     kesa.questions.last.course_theme_questions.create! :course_theme => var

     kesa.publish!


     ohpes2009 = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => course_exams.id, :date => Date.new(2009, 10, 21), :maximum_points => 50, :language => 'fi'

     ohpes2009.questions.create :number => 1 , :name => %&Säätiöllä on kaksi rahasäiliötä. Toinen säiliö on itse hankituille rahoille, toinen säiliö on valtiolta saaduille tukirahoille. Kutsutaan säiliöitä nimillä "varat-säiliö" ja "tuet-säiliö". Tuet-säiliö ei saa olla negatiivinen. Varat-säiliö sitävastoin saa: negatiivinen arvo tarkoittaa että säätiö on velkaa, positiivinen että säätiöllä on itse hankittua varallisuutta. Ohjelmoi luokka Saatio säätiön toteutukseksi.

    * public Saatio(double varat, double tuet) luo Saatio-olion. Säiliöiden alkupääomat annetaan parametreina.

    * public double getVarat() palauttaa varat-säiliön arvon
    * public double getTuet() palauttaa tuet-säiliön arvon
    * public double getTase() palauttaa säätiön kokonaistilanteen, taseen, so. säiliöiden summan

    * public void varallisuusmuutos(double määrä) muuttaa varat-säiliön sisältöä parametrin verran, parametri saa olla negatiivinenkin
    * public boolean valtioltaTukea(double määrä) lisää tuet-säiliön sisältöä parametrin verran; vain positiivinen tuki kelpaa. Jos valtio yritti ottaa rahaa säätiöltä "negatiivisen tuen" nimissä, metodi palauttaa arvon false, muuten true.

    * public double siirräTukeaVaroihin(double määrä) siirtää parametrin verran rahaa tuet-säiliöstä varat-säiliöön. Jos siirrettävää ei ole pyydettyä määrää, siirretään, mitä voidaan. Jos parametri on negatiivinen, mitään siirtoja ei tehdä -- eihän varallisuutta voi ruveta tueksi kutsumaan. Arvonaan metodi palauttaa siirretyn määrän.

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen säätiön tilasta

Havainnollista Saatio-luokan käyttöä pienellä pääohjelmalla. Tämän ohjelman ei tarvitse eikä ole syytä lukea mitään. Älä turhaan yritä etsiä Saatio-luokalle vastineita todellisuudesta! Ohjelmoi vain niin kuin "API" käskee. &, :description => "", :points => 16

     ohpes2009.questions.last.course_theme_questions.create :course_theme => objects
     ohpes2009.questions.last.course_theme_questions.create :course_theme => var
     ohpes2009.questions.last.course_theme_questions.create :course_theme => classes


     ohpes2009.questions.create :number => 2 , :name => %&Selitä lyhyesti ja selkeästi käsitteet parametri, konstruktori, aksessori, kapselointi.&, :description => "", :points => 16

     ohpes2009.questions.last.course_theme_questions.create :course_theme => var


     ohpes2009.questions.create :number => 3 , :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena eli keskustelevana ohjelmana:  Aamuisin ohjelmalle syötetään ensin tasan tuhat onnenlukua missä järjestyksessä tahansa. Onnenluvut ovat positiivisia kokonaislukuja. Sama luku saa esiintyä useamminkin kuin kerran. Päivän mittaan pelaajat käyvät sitten arvaamassa lukuja. Jos pelaaja onnistuu arvaamaan jonkin luvun, joka oli aamulla syötettyjen lukujen joukossa, ohjelma onnittelee pelaajaa. Jos pelaaja epäonnistuu, ohjelma esittää valittelunsa. Ohjelman suoritus päättyy, kun arvatuksi luvuksi syötetään nolla tai negatiivinen luku. Tällöin ohjelma tulostaa oikeiden ja väärien arvausten määrän. Tehokkuussyistä lukujen hakeminen taulukosta on ohjelmoitava binäärihakua käyttäen. Saat olettaa, että kaikki syötetyt tiedot ovat kelvollisia kokonaislukuja.&, :description => "", :points => 18

     ohpes2009.questions.last.course_theme_questions.create :course_theme => objects
     ohpes2009.questions.last.course_theme_questions.create :course_theme => var
     ohpes2009.questions.last.course_theme_questions.create :course_theme => classes
     ohpes2009.questions.last.course_theme_questions.create :course_theme => sub

     ohpes2009.publish!





     ohpek2008 = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => course_exams.id, :date => Date.new(2008, 6, 14), :maximum_points => 50, :language => 'fi'

     ohpek2008.questions.create :number => 1 , :name => %&Selitä lyhyesti ja selkeästi käsitteet muuttujan tyyppi, parametri, kapselointi, new-ilmaus, toString()-metodi, indeksi.&, :description => "", :points => 18

     ohpek2008.questions.last.course_theme_questions.create :course_theme => objects
     ohpek2008.questions.last.course_theme_questions.create :course_theme => var
     ohpek2008.questions.last.course_theme_questions.create :course_theme => alg


     ohpek2008.questions.create :number => 2 , :name => %&Virvoitusjuoma-automaatissa on kaksi säiliötä: vesisäiliö ja makuainesäiliö. Juomaa valmistetaan sekoittamalla yksi osa makuainetta ja yhdeksän osaa vettä.

Ohjelmoi luokka VirvoitusjuomaAutomaatti virvoitusjuoma-automaatin toteutukseksi. (Konstruktori ja aksessorit tulkitsevat negatiiviset parametrien arvot nollaksi. Säiliöitä ei toteuteta PikkuVarasto-oliona!)

    * public VirvoitusjuomaAutomaatti(double vesiVetoisuus, double makuaineVetoisuus) luo virvoitusjuoma-automaatin, jonka säiliöiden vetoisuudet annetaan parametreina. Säiliöt ovat uudessa virvoitusjuoma-automaatissa tyhjiä.

    * public double lisääVettä(double määrä) lisää vettä vesisäiliöön. Metodi palauttaa arvonaan veden määrän, joka ei mahtunut varastoon. Palautetaan siis nolla, jos kaikki lisättävä vesi mahtui.

    * public double lisääMakuainetta(double määrä) lisää makuainetta makuainesäiliöön. Metodi palauttaa arvonaan makuaineen määrän, joka ei mahtunut varastoon. Palautetaan siis nolla, jos kaikki lisättävä makuaine mahtui säiliöön.

    * public boolean valmistaVirvoitusjuomaAnnos() valmistaa virvoitusjuomaa vedestä ja makuaineesta. Annoksen koko on 0.2 yksikköä. Jos raaka-aineita ei ole riittävästi metodi palauttaa arvon false. Jos virvoitusjuomanvalmistus onnistuu, metodi palauttaa arvon true. Asiallisesti ottaen metodi siis pyrkii vähentämään vesivarastoa 0.18 yksiköllä ja makuainesäiliötä 0.02 yksiköllä!

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen virvoitusjuoma-automaatin tilasta.

Laadi myös pääohjelma, joka esittelee ja havainnollistaa VirvoitusjuomaAutomaatti-olioiden käyttöä.&, :description => "", :points => 16

     ohpek2008.questions.last.course_theme_questions.create :course_theme => var
     ohpek2008.questions.last.course_theme_questions.create :course_theme => objects
     ohpek2008.questions.last.course_theme_questions.create :course_theme => classes
     ohpek2008.questions.last.course_theme_questions.create :course_theme => alg


     ohpek2008.questions.create :number => 3 , :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena eli keskustelevana ohjelmana:  Aamuisin ohjelmalle syötetään ensin tasan tuhat onnenlukua missä järjestyksessä milloinkin. Onnenluvut ovat positiivisia kokonaislukuja. Päivän mittaan pelaajat käyvät sitten arvaamassa lukuja. Jos pelaaja onnistuu arvaamaan jonkin luvun, joka oli aamulla syötettyjen lukujen joukossa, ohjelma onnittelee pelaajaa. Jos pelaaja epäonnistuu, ohjelma esittää valittelunsa. Ohjelman suoritus päättyy, kun arvatuksi luvuksi syötetään nolla tai negatiivinen luku. Tällöin ohjelma tulostaa oikeiden ja väärien arvausten määrän. Tehokkuussyistä lukujen hakeminen taulukosta on ohjelmoitava binäärihakua käyttäen. &, :description => "", :points => 18

     ohpek2008.questions.last.course_theme_questions.create :course_theme => objects
     ohpek2008.questions.last.course_theme_questions.create :course_theme => var
     ohpek2008.questions.last.course_theme_questions.create :course_theme => classes
     ohpek2008.questions.last.course_theme_questions.create :course_theme => sub

     ohpek2008.publish!





     ohpek2007 = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => course_exams.id, :date => Date.new(2007, 6, 9), :maximum_points => 50, :language => 'fi'

     ohpek2007.questions.create :number => 1 , :name => %&"Olio, mikä hemmetin olio?", kysyy ystäväsi kuunnellessaan tarinoitasi Ohjelmoinnin perusteet -kurssilta. Ystäväsi on ohjelmoinut sen verran, että hän tuntee yksinkertaiset muuttujat, lausekkeet, lauseet, metodit ja parametrit, mutta olio-ohjelmoinnista hän ei tiedä yhtään mitään. Auta ystävääsi ymmärtämään, mitä oliot ovat, miten niitä ohjelmoidaan ja käytetään, mitä hyötyä ja iloa niistä voi olla. Laadi siis asiasta kirjallinen selitys (maksimipituus on 1 konseptiarkki). Muista että esimerkit auttavat oppimisessa. Vastauksen arvioinnissa otetaan huomioon selostuksen ajateltu lukija. Älä siis kirjoita tarkastajalle, joka jo osaa oliot, kirjoita tuolle ystävälle!&, :description => "", :points => 16

     ohpek2007.questions.last.course_theme_questions.create :course_theme => objects


     ohpek2007.questions.create :number => 2 , :name => %&Sekuntilaskuri tuntee sekunnit, minuutit ja tunteja vuorokauden verran. Laskuri voi vain edetä. Kun sekunnit ylittävät arvon 59 yhdellä, minuutit kasvavat ja sekunnit nollataan. Kun minuutit ylittävät arvon 59 yhdellä, tunnit kasvavat ja minuutit nollataan. Kun laskuri ylittää arvon 23:59:59 (23 tuntia, 59 minuuttia, 59 sekuntia), aloitetaan uudelleen arvosta 0:0:0. Laskuri siis laskee: 0:0:0, 0:0:1, ..., 0:0:59, 0:1:0, 0:1:1, 0:1:2, ..., 0:59:57, 0:59:58, 0:59:59, 1:0:0, 1:0:1,..., 23:59:58, 23:59:59, 0:0:0

Toteuta luokka Sekuntilaskuri

    * public Sekuntilaskuri() luo sekuntilaskurin, jonka alkuarvo on 0:0:0
    * public int annaMinuutit() palauttaa arvonaan minuuttien määrän
    * public int annaSekunnit() palauttaa arvonaan sekuntien määrän
    * public int annaTunnit() palauttaa arvonaan tuntien määrän
    * public void lisaaSekunti() lisää sekuntien määrää yhdellä

Varusta luokka metodilla toString(), jonka ansiosta olion arvo saadaan tulostettua muodossa tunnit:minuutit:sekunnit, siis esimerkiksi "14:7:53". &, :description => "", :points => 16

     ohpek2007.questions.last.course_theme_questions.create :course_theme => var
     ohpek2007.questions.last.course_theme_questions.create :course_theme => objects
     ohpek2007.questions.last.course_theme_questions.create :course_theme => classes
     ohpek2007.questions.last.course_theme_questions.create :course_theme => alg


     ohpek2007.questions.create :number => 3 , :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena eli keskustelevana ohjelmana:  Aamuisin ohjelmalle syötetään ensin tasan tuhat onnenlukua missä järjestyksessä milloinkin. Onnenluvut ovat positiivisia kokonaislukuja. Päivän mittaan pelaajat käyvät sitten arvaamassa lukuja. Jos pelaaja onnistuu arvaamaan jonkin luvun, joka oli aamulla syötettyjen lukujen joukossa, ohjelma onnittelee pelaajaa. Jos pelaaja epäonnistuu, ohjelma esittää valittelunsa. Ohjelman suoritus päättyy, kun arvatuksi luvuksi syötetään nolla tai negatiivinen luku. Tällöin ohjelma tulostaa oikeiden ja väärien arvausten määrän. Tehokkuussyistä lukujen hakeminen taulukosta on ohjelmoitava binäärihakua käyttäen. &, :description => "", :points => 18

     ohpek2008.questions.last.course_theme_questions.create :course_theme => objects
     ohpek2008.questions.last.course_theme_questions.create :course_theme => var
     ohpek2008.questions.last.course_theme_questions.create :course_theme => classes
     ohpek2008.questions.last.course_theme_questions.create :course_theme => sub

     ohpek2008.publish!










     ohmas08 = Course.find_by_code(582104).exams.only_public.create :lecturer => 5, :type_id => course_exams.id, :date => Date.new(2009, 12, 16), :maximum_points => 28, :language => 'fi'
     ohmas08.questions.create :number => 1 , :name => %&Tässä tehtävässä kiinnitetään huomiota kurssin suuriin linjoihin. Tehtävä on
jaettu alakohtiin, mutta voit myös vastata yhden kaikenkattavan esseen avulla. Tässä
ei siis haeta mitään yhden sanan vastauksia/ranskalaisia viivoja, vaan järkevästi
muotoiltua ja perusteltua tekstiä. Muista kuitenkin keskittyä olennaiseen. Koko tehtävän
vastauksen tuskin tarvitsee ylittää kahta A4-sivua.&, :description => %&a. (2p) Mistä vaiheista ohjelmistotuotantoprosessi koostuu? Mitä kunkin vaiheen
aikana tapahtuu?
b. (3p) Mitä tarkoitetaan vesiputousmallilla? Entä iteratiivisella ja ketterällä ohjelmistotuotantomenetelmillä?
Mikä johti ketterien ja iteratiivisten menetelmien
kehittämiseen?
c. (3p) Miten UML liittyy kaikkeen edelliseen?&, :points => 8
     ohmas08.questions.create :number => 2 , :name => %&Luokka- ja sekvenssikaavioita.&, :description => %&a. (7p) Mallinna seuraavassa kuvattu tilanne luokkakaaviona. Tässä tehtävässä luokille
ei tarvitse määritellä metodeja eikä attribuutteja. Yhteyksien kytkentärajoitteet
ja tyypit sekä tarvittaessa myös nimet ja roolinimet on merkittävä
tarkasti.
Unix-tyyppisissä järjestelmissä "tiedostoja" ovat sekä normaalit tiedostot, hakemistot
että ns. laitetiedostot.
Laitetiedostoon liittyy jokin I/O-laite, esim. hiiri, näppäimistö tai näyttö. I/Olaitetta
kohti on tasan yksi laitetiedosto. Normaali tiedosto on jono tavuja.
Tietty tavu kuuluu vain yhteen tiedostoon.
Hakemisto koostuu joukosta muita tiedostoja (jotka voivat siis olla normaaleja
tiedostoja, hakemistoja tai laitetiedostoja). Tiedosto on kerrallaan vain yhdessä
hakemistossa, mutta ei välttämättä koko aikaa samassa hakemistossa1.
Unixissa on käyttäjiä ja käyttäjäryhmiä. Käyttäjä voi kuulua useampaan ryhmään
ja ryhmässä voi olla useita käyttäjiä. Käyttäjät käyttävät I/O-laitteita.
Jokaisella tiedostolla on omistajana tasan yksi käyttäjä. Käyttäjä voi omistaa
useita tiedostoja. Tiedostoihin voi olla käyttöoikeuksia sekä käyttäjillä että ryhmillä.
Sekä käyttäjällä että ryhmällä voi olla käyttöoikeuksia useisiin tiedostoihin.
Oikeasti Unixeissa käyttöoikeudet jakautuvat luku-, kirjoitus- ja suoritusoikeuksiin,
mutta tässä tehtävässä emme siitä välitä, vaan mallinnamme ainoastaan
yhden tyyppisen käyttöoikeuden. Eli esim. käyttäjällä joko on tai ei ole käyttöoikeutta
tiettyyn tiedostoon. Yhdellä tiedostolla voi olla useita käyttöoikeuden
omaavia käyttäjiä ja ryhmiä
b. (3p) Viimeiseltä sivulta löytyy katkelma Java-koodia. Piirrä sekvenssikaaviona
tilanne, jossa kutsutaan (jostain koodin ulkopuolella olevasta metodista) ensin
Machine-luokan konstruktoria ja sen jälkeen luodun Machine-olion drive()-metodia.
public class Machine {
  private FuelTank tank;
  private Engine engine;

  public Machine() {
    tank = new FuelTank();
    tank.fill(40);
    engine = new Engine(tank);
  }
  void drive() {
    engine.start();
    boolean running = engine.isRunning();
    if { running } engine.useEnergy();
  }
}
class FuelTank {
  private int fuelContents;
  FuelTank() {
    fuelContents = 0;
  }
  void fill(int amount) {
    fuelContents = amount;
  }
  int contentsLeft() {
    return fuelContents;
  }
  void consume(int amount) {
    fuelContents = fuelContents - amount;
  }
}
class Engine {
  private FuelTank fuelTank;
  Engine(FuelTank tank) {
    fuelTank = tank;
  }
  void start() {
    fuelTank.consume(5);
  }
  boolean isRunning() {
    return fuelTank.contentsLeft() > 0;
  }
  void useEnergy() {
    fuelTank.consume(10);
  }
}&, :points => 10
     ohmas08.questions.create :number => 3 , :name => %&Tarkastellaan harjoitustyön seurantaan liittyvää tietojärjestelmää.
Aloittaessaan harjoitustyön opiskelija saa ohaajan ja aiheen. Opiskelija tapaa ohjaajana
toimivan opettajan kerran viikossa sovittuna aikana. Opiskelija voi valita ajan
opettajan tarjolle laittamien aikojen joukosta. Sovittu aika voi vaihdella viikottain.
Kussakin tapaamisessa kirjataan työhön siihen mennessä käytetty aika sekä työn etenemisen
aste. Opettaja voi lisäksi kirjata kommentteja tapaamiseen liittyen. Kommentit
ja kirjatut tiedot ovat vain opettajan luettavissa. Sekä opettaja että opiskelija
näkevät järjestelmästä tapaamisaikavarauksensa.
Opiskelija jättää harjoitustyöstä tarkastukseen yhden väliraportin ja loppuraportin,
palautus tapahtuu järjestelmän välityksellä. Näistä kummastakin hän saa kirjallisen
palautteen ja loppuraportista lisäksi arvosanan. Opiskelija saa palautteen järjestelmän
kautta.&, :description => %&a. (5p) Laadi kuvatusta tietojärjestelmästä karkean tason käyttötapausmalli, eli etsi
käyttäjät ja käyttötapaukset nimen tasolla. Määrittele kunkin käyttötapauksen
tarkoitus lyhyesti (eli maksimissaan rivi per käyttötapaus) tekstinä. Piirrä myös
käyttötapauskaavio.
b. (2p) Kuvaa yksi käyttötapauksista tarkemmalla tasolla, ns. Cockburnin käyttötapauspohjan
tai luentomonisteen tekstuaalisten käyttötapauskuvausten tyyliin.
c. (3p) Laadi järjestelmän kuvauksen perusteella määrittelytason (eli kohdealueen)
luokkakaavio. Metodeja luokille ei tässä vaiheessa laiteta. Yhteyksien tarkempi
laatukaan (normaali, kompositio vai kooste ja navigointisuunnat) ei ole vielä
tärkeää. Merkkaa kuitenkin kaikkiin yhteyksiin kytkentärajoitteet ja nimeä yhteydet
ja yhteysroolit tarvittaessa. Ilmeisimmät attribuutit luokille kannattaa
merkitä.&, :points => 10

ohmas08.publish!

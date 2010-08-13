#     perusopinnot = Level.create :name_fi => 'Perusopinnot'
#     aineopinnot = Level.create :name_fi => 'Aineopinnot'
#     syventävätopinnot = Level.create :name_fi => 'Syventävät opinnot'
#     muutopinnot = Level.create :name_fi => 'Muut opinnot'

     erilliskoe = Type.create :name_fi => 'Erilliskoe'
     kurssikoe = Type.create :name_fi => 'Kurssikoe'
     uusintakoe = Type.create :name_fi => 'Uusintakoe'
     generoitu_koe = Type.create :name_fi => 'Generoitu koe'

     algorithm_theme = Theme.create :name_fi => 'Algoritmit ja ohjausrakenteet'
     algorithm_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     variable_theme = Theme.create :name_fi => 'Muuttujat ja tyypit'
     variable_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     subroutines_theme = Theme.create :name_fi => 'Aliohjelmat'
     subroutines_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     class_theme = Theme.create :name_fi => 'Luokat'
     class_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     objects_theme = Theme.create :name_fi => 'Oliot ja kapselointi'
     objects_theme.course_themes.create :course_id => Course.find_by_code(581325).id

     kesa = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => kurssikoe.id, :date => Date.new(2010, 6, 12), :maximum_points => 50, :language => 'fi'
     Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => erilliskoe.id, :date => Date.new(2010, 6, 1), :maximum_points => 60
     Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => uusintakoe.id, :date => Date.new(2010, 8, 30), :maximum_points => 50

     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => erilliskoe.id , :date => Date.new(2010, 6, 4), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => kurssikoe.id , :date => Date.new(2009, 10 , 22), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => uusintakoe.id , :date => Date.new(2010, 1, 22), :maximum_points => 60

     Course.find_by_code(582313).exams.create :lecturer => 4, :type_id => kurssikoe.id , :date => Date.new(2009, 10, 21), :maximum_points => 60

     kesa.questions.create :number => 1 , :name => %&Selitä lyhyesti ja selkeästi käsitteet parametri, konstruktori, aksessori, kapselointi&, :description => "", :points => 16

     kesa.questions.first.course_theme_questions.create :course_theme => objects_theme
     kesa.questions.first.course_theme_questions.create :course_theme => variable_theme

     kesa.questions.create :number => 2 , :description => %&* public OliiviOljyAsema (double pääsailiö, double varastosailio) luo oliiviöljyaseman, jonka säiliöiden vetoisuudet annetaan parametreina. Jos vetoisuus on virheellinen, säiliön kooksi asetetaan 100 litraa. Molemmat säiliöt ovat aluksi tyhjiä.

    * public double getPaa() palauttaa tiedon pääsäiliön öljymäärästä
    * public double getVara() palauttaa tiedon varastosäiliön öljymäärästä
    * public double getYht() palauttaa tiedon aseman koko öljymäärästä

    * public boolean lisaaOljya(double maara) lisää öljyä pääsäiliöön. Jos yritetään lisätä enemmän kuin pääsäiliöön mahtuu, ylimääräinen öljy pumpataan varastosäiliöön. Jos koko lisättävä määrä ei mahtu säiliöihin, öljyn määrää kummassakaan säiliössä ei muuteta. Metodi palauttaa arvon true, jos lisäys onnistui, muuten false.

    * public double otaOljya(double maara) ottaa öljyä pääsäiliöstä. Jos pyydetään enemmän kuin pääsäiliössä on, öljyä siirretään automaattisesti varastosäiliöstä pääsäiliöön. Jos edes molempien säiliöiden öljy ei riitä, annetaan mitä voidaan. Metodi palauttaa arvonaan saadun öljyn määrän.

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen oliiviöljyaseman tilasta 

Havainnollista OliiviOljyAsema-luokan käyttöä pienellä pääohjelmalla. Tämän ohjelman ei tarvitse eikä ole syytä lukea mitään.&, :name => %&Oliiviöljyasemalla on kaksi öljysäiliötä. Vain pääsäiliöön voidaan suoraan lisätä öljyä ja vain pääsäiliöstä asiakas voi tankata öljyä. Toinen säiliö on varastosäiliö, jota käytetään automaattisesti hyväksi, kun ensimmäisen säiliön kapasiteetti ei riitä. Laadi luokka OliiviOljyAsema oliiviöljyaseman toteutukseksi.&, :points => 17

     kesa.questions.last.course_theme_questions.create! :course_theme => objects_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => class_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => algorithm_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => variable_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => subroutine_theme


     kesa.questions.create :number => 3 , :description => %&Ennen pelin alkua pelinjohtaja syöttää ohjelmalle sata kokonaislukua satunnaisessa järjestyksessä.  Luvut saavat olla mitä tahansa kokonaislukuja. Sama luku saa esiintyä useammankin kerran.

Tämän jälkeen pelaaja alkaa käyttää ohjelmaa. Pelaaja yrittää arvata pelinjohtajan koneeseen syöttämiä lukuja. Peli päättyy, kun pelaaja onnistuu arvaamaan jonkin pelinjohtajan syöttämän luvun. Pelin tulos on tarvittujen arvausten määrä, jonka ohjelma lopuksi tulostaa.

Saat olettaa, että kaikki syötetyt luvut ovat kelvollisia kokonaislukuja.

Arvattavien lukujen hakeminen on tehokkuussyistä ohjelmoitava binäärihakua käyttäen. &, :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena ohjelmana:&, :points => 17

     kesa.questions.last.course_theme_questions.create! :course_theme => algorithm_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => subroutine_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => class_theme
     kesa.questions.last.course_theme_questions.create! :course_theme => variable_theme

     kesa.publish!


     
     ohmas08 = Course.find_by_code(582104).exams.only_public.create :lecturer => 5, :type_id => kurssikoe.id, :date => Date.new(2009, 12, 16), :maximum_points => 28, :language => 'fi'
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

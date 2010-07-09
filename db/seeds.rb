peru = Level.create :name_fi => 'Perusopinnot'
aine = Level.create :name_fi => 'Aineopinnot'
syve = Level.create :name_fi => 'Syventävät opinnot'
muut = Level.create :name_fi => 'Muut opinnot'
syve.courses.create :code => 581544, :name_fi => "Olio-ohjelmointi", :name_se => "Objektprogrammering", :name_en => "Object-Oriented Programming",  :credits => 8.0
syve.courses.create :code => 58060, :name_fi => "Tietokoneverkot", :name_se => "Datornät", :name_en => "Computer Networks",  :credits => 8.0
syve.courses.create :code => 581373, :name_fi => "Tietoliikenteen suorituskyvyn analysointi", :name_se => "Analysering av prestanda i datakommunikation", :name_en => "Performance Analysis of Data Communications",  :credits => 4.0
syve.courses.create :code => 58064, :name_fi => "Käyttöliittymät", :name_se => "Användargränssnitt", :name_en => "User Interfaces",  :credits => 8.0
syve.courses.create :code => 58081, :name_fi => "Tietämyskannat", :name_se => "Kunskapsbaser", :name_en => "Knowledge Bases",  :credits => 4.0
syve.courses.create :code => 58109, :name_fi => "Tapahtumakäsittely", :name_se => "Transaktionsbehandling", :name_en => "Transaction Processing",  :credits => 8.0
syve.courses.create :code => 581550, :name_fi => "Tietämyksen muodostaminen", :name_se => "Kunskapsutvinning", :name_en => "Data Mining",  :credits => 6.0
syve.courses.create :code => 581376, :name_fi => "Tosiaikatietokannat", :name_se => "Realtidsdatabaser", :name_en => "Real Time Databases",  :credits => 4.0
syve.courses.create :code => 581545, :name_fi => "Tietokantojen suorituskyvyn arviointi", :name_se => "Värdering av databaser", :name_en => "Performance Analysis of Databases",  :credits => 4.0
peru.courses.create :code => 58125, :name_fi => "Informaatiojärjestelmät", :name_se => "Informationssystem", :name_en => "Information Systems",  :credits => 8.0
peru.courses.create :code => 58128, :name_fi => "UNIX-perusteet", :name_se => "Grunderna i UNIX", :name_en => "Introduction to UNIX",  :credits => 2.0
syve.courses.create :code => 581255, :name_fi => "Aikalogiikka ja järjestelmien verifiointi", :name_se => "Temporal logik och verifiering av system", :name_en => "Temporal logic and verification",  :credits => 6.0
peru.courses.create :code => 58122, :name_fi => "Ohjelmointi (Pascal)", :name_se => "Programmering (Pascal)", :name_en => "Programming (Pascal)",  :credits => 8.0
peru.courses.create :code => 580212, :name_fi => "Tietotekniikan alkeet (pääaineopiskelijoille)", :name_se => "Introduktion till datateknik", :name_en => "Introduction to computing",  :credits => 4.0
peru.courses.create :code => 580213, :name_fi => "Tietotekniikan alkeet", :name_se => "Introduktion till datateknik", :name_en => "Introduction to computing",  :credits => 4.0
syve.courses.create :code => 581540, :name_fi => "Oliotietokannat", :name_se => "Objektdatabaser", :name_en => "Object-Oriented Databases",  :credits => 8.0
syve.courses.create :code => 58139, :name_fi => "Tietokoneavusteinen yhteistyö", :name_se => "Datorstött samarbete", :name_en => "Computer-Supported Cooperative Work",  :credits => 6.0
syve.courses.create :code => 581244, :name_fi => "Kompleksiset laskentajärjestelmät", :name_se => "Komplexa beräkningsystem", :name_en => "Complex Computation Systems",  :credits => 8.0
syve.courses.create :code => 581245, :name_fi => "Rinnakkaislaskennan algoritmit", :name_se => "Algoritmer för parallellberäkning", :name_en => "Algorithms for Parallel Computation",  :credits => 6.0
syve.courses.create :code => 581246, :name_fi => "Ohjelmistotuotannon jatkokurssi", :name_se => "Avancerad kurs i programvaruproduktion", :name_en => "Foundations in Software Engineering",  :credits => 8.0
syve.courses.create :code => 58045, :name_fi => "Simulointimenetelmät", :name_se => "Simuleringsmetoder", :name_en => "Simulation",  :credits => 4.0
syve.courses.create :code => 581546, :name_fi => "Ohjelmistojen suorituskyvyn suunnittelu", :name_se => "Prestandaplanering för programvara", :name_en => "Software Performance Engineering",  :credits => 4.0
peru.courses.create :code => 581249, :name_fi => "Julkaisutekniikan alkeet", :name_se => "Grunderna i publiceringsteknik", :name_en => "Introduction to Document Preparation",  :credits => 4.0
syve.courses.create :code => 58143, :name_fi => "Systeemityön menetelmät", :name_se => "Metoder för systemutveckling", :name_en => "Information Systems Methodologies",  :credits => 8.0
syve.courses.create :code => 581375, :name_fi => "Rinnakkaisohjelmoinnin periaatteet I", :name_se => "Grunderna i parallellprogrammering I", :name_en => "Principles of Concurrent Programming I",  :credits => 6.0
syve.courses.create :code => 581243, :name_fi => "Langaton tietoliikenne", :name_se => "Trådlös datakommunikation", :name_en => "Wireless Data Communication",  :credits => 6.0
syve.courses.create :code => 581252, :name_fi => "Robotiikka", :name_se => "Robotik", :name_en => "Robotics",  :credits => 8.0
aine.courses.create :code => 581253, :name_fi => "Java-ohjelmointi", :name_se => "Java-programmering", :name_en => "Programming in Java",  :credits => 6.0
syve.courses.create :code => 581254, :name_fi => "Probabilistinen päättely", :name_se => "Probabilistisk sludledning", :name_en => "e",  :credits => 6.0
peru.courses.create :code => 581258, :name_fi => "Johdatus ohjelmointiin", :name_se => "Introduktion till programmering", :name_en => "e",  :credits => 8.0
aine.courses.create :code => 581263, :name_fi => "Ohjelmointitekniikka (Ada)", :name_se => "Programmeringsteknik (Ada)", :name_en => "Software Design (Ada)",  :credits => 4.0
aine.courses.create :code => 581259, :name_fi => "Ohjelmistotuotanto", :name_se => "Programvaruproduktion", :name_en => "Software Engineering",  :credits => 4.0
aine.courses.create :code => 581266, :name_fi => "Langattomat tietoliikenneverkot", :name_se => "Trådlösa datakommunikationsnät", :name_en => "e",  :credits => 2.0
aine.courses.create :code => 581264, :name_fi => "Tutkimustiedonhallinnan peruskurssi", :name_se => "Grundkurs i hantering av forskningsdata", :name_en => "Management of research data",  :credits => 6.0
aine.courses.create :code => 581265, :name_fi => "Digitaalinen signaalinkäsittely", :name_se => "Digital signalbehandling", :name_en => "Digital Signal Processing",  :credits => 6.0
syve.courses.create :code => 581268, :name_fi => "Ongelmanratkaisu", :name_se => "Problemlösning", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 581269, :name_fi => "Laskennallinen biologia", :name_se => "Beräkningsbiologi", :name_en => "Computational Biology",  :credits => 8.0
syve.courses.create :code => 581271, :name_fi => "Kuvankäsittelyn sovelluksia", :name_se => "Applikationer för bildhantering", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 581275, :name_fi => "Rinnakkaisohjelmoinnin periaatteet II", :name_se => "Grunderna i parallellprogrammering II", :name_en => "Principles of Concurrent Programming II",  :credits => 6.0
aine.courses.create :code => 581285, :name_fi => "CORBA-arkkitehtuuri", :name_se => "CORBA-arkitekturen", :name_en => "e",  :credits => 6.0
syve.courses.create :code => 581288, :name_fi => "Tietoturva", :name_se => "Datasäkerhet", :name_en => "Computer Security",  :credits => 4.0
syve.courses.create :code => 581289, :name_fi => "Tietoliikenteen jatkokurssi", :name_se => "Fördjupad kurs i kommunikation", :name_en => "Advanced Topics in Telecommunication Systems",  :credits => 6.0
syve.courses.create :code => 581304, :name_fi => "Algoritmisia ongelmia rakennebiologiassa ja geenitekniikassa", :name_se => "Algoritmiska problem i strukturell biologi och genteknik", :name_en => "e",  :credits => 8.0
peru.courses.create :code => 581357, :name_fi => "Introduktion till datorn som arbetsredskap", :name_se => "Introduktion till datorn som arbetsredskap", :name_en => "Introduktion till datorn som arbetsredskap",  :credits => 4.0
peru.courses.create :code => 581326, :name_fi => "Java-ohjelmointi", :name_se => "Java-programmering", :name_en => "Programming in Java",  :credits => 4.0
aine.courses.create :code => 581377, :name_fi => "Uusmediasovellusten tekniikat", :name_se => "Tekniker för tillämpningar inom nymedia", :name_en => "Techniques for new media applications",  :credits => 6.0
aine.courses.create :code => 581378, :name_fi => "Algoritmisen tietojenkäsittelyn perusteet", :name_se => "Principer för algoritmisk databehandling", :name_en => "Principles of algorithmics",  :credits => 4.0
aine.courses.create :code => 581379, :name_fi => "Muuntokoulutuksen peruskurssi (Java)", :name_se => "Grundkurs för examensinriktad fortbildning", :name_en => "Basics for Upgrading Studies",  :credits => 8.0
syve.courses.create :code => 581338, :name_fi => "Algoritmitekniikka", :name_se => "Algoritmteknik", :name_en => "Algorithm technology",  :credits => 8.0
syve.courses.create :code => 581360, :name_fi => "Ohjelmistoprojektien johtaminen ja ryhmädynamiikka", :name_se => "Ledning av programvaruprojekt", :name_en => "Software Project Management and Group Dynamics",  :credits => 5.0
syve.courses.create :code => 581382, :name_fi => "Agenttiteknologia", :name_se => "Agentteknologi", :name_en => "Agent technology",  :credits => 4.0
syve.courses.create :code => 581383, :name_fi => "ATM-tietoliikenne", :name_se => "ATM-datakommunikation", :name_en => "ATM-Data Communications",  :credits => 4.0
aine.courses.create :code => 581389, :name_fi => "Perl-ohjelmointikieli", :name_se => "Programmeringsspråket Perl", :name_en => "e",  :credits => 4.0
aine.courses.create :code => 581384, :name_fi => "Introduction to the use of computers", :name_se => "Introduction to the use of computers", :name_en => "Introduction to the use of computers",  :credits => 4.0
syve.courses.create :code => 58, :name_fi => "Seminaarien ennakkoilmoittautuminen", :name_se => "Förhandsanmälan till seminarierna", :name_en => "Advance registration for seminars",  :credits => 4.0
aine.courses.create :code => 581305, :name_fi => "Tietokoneen toiminta", :name_se => "Datororganisation I", :name_en => "Computer Organization I",  :credits => 4.0
aine.courses.create :code => 581306, :name_fi => "Tietorakenteet", :name_se => "Datastrukturer", :name_en => "Data structures",  :credits => 8.0
aine.courses.create :code => 581388, :name_fi => "Data-analyysin laskennallisia menetelmiä (Fortran)", :name_se => "Dataanalysens beräkningsmetoder (Fortran)", :name_en => "e",  :credits => 6.0
muut.courses.create :code => 581387, :name_fi => "Tietotekniikka: nyt!", :name_se => "Datateknik: nu!", :name_en => "Information Technology: Now!",  :credits => 3.0
syve.courses.create :code => 581336, :name_fi => "Laskennan teoria", :name_se => "Beräkningsteori", :name_en => "Theory of Computation",  :credits => 6.0
syve.courses.create :code => 581385, :name_fi => "Advanced Wireless Communication Systems", :name_se => "Advanced Wireless Communication Systems", :name_en => "Advanced Wireless Communication Systems",  :credits => 4.0
syve.courses.create :code => 581356, :name_fi => "Ohjelmistojen tuotteistaminen ja liiketoiminta", :name_se => "Från innovation till programvarumarknad", :name_en => "From Innovation to Software Business",  :credits => 6.0
syve.courses.create :code => 581362, :name_fi => "Ohjelmointikielten periaatteet", :name_se => "Programmeringsspråkens principer", :name_en => "Principles of Programming Languages",  :credits => 4.0
syve.courses.create :code => 581386, :name_fi => "Rinnakkaisten järjestelmien ulkoinen käyttäytyminen", :name_se => "Yttre funktioner hos parallella system", :name_en => "Externally observable behaviour of concurrent systems",  :credits => 6.0
syve.courses.create :code => 582401, :name_fi => "Geometriset menetelmät", :name_se => "Geometriska metoder", :name_en => "Geometric Methods",  :credits => 8.0
muut.courses.create :code => 581308, :name_fi => "Inductive Logic Programming", :name_se => "Inductive Logic Programming", :name_en => "Inductive Logic Programming",  :credits => 2.0
aine.courses.create :code => 582306, :name_fi => "EPOC: arkkitehtuuri ja ohjelmointi", :name_se => "EPOC: arkitektur och programmering", :name_en => "EPOC: Architecture and Programming",  :credits => 4.0
peru.courses.create :code => 581325, :name_fi => "Ohjelmoinnin perusteet", :name_se => "Introduktion till programmering", :name_en => "Introduction to Programming",  :credits => 5.0
syve.courses.create :code => 581361, :name_fi => "Ohjelmistojen testaus", :name_se => "Testning av programvara", :name_en => "Software Testing",  :credits => 4.0
aine.courses.create :code => 581330, :name_fi => "Ohjelmoinnin ja laskennan perusmallit", :name_se => "Modeller för programmering och kalkylering", :name_en => "Models for Programming and Computing",  :credits => 4.0
syve.courses.create :code => 582301, :name_fi => "Algoritmien oikeellisuus ja johtaminen", :name_se => "Verifiering och derivering av algoritmer", :name_en => "Verification and Derivation of Algorithms",  :credits => 6.0
syve.courses.create :code => 581358, :name_fi => "Ohjelmistoarkkitehtuurit", :name_se => "Programvaruarkitektur", :name_en => "Software Architecture",  :credits => 5.0
syve.courses.create :code => 582402, :name_fi => "Verkkokaupan tuki Internetissä", :name_se => "Stöd för näthandel på Internet", :name_en => "Electronic Commerce and Internet",  :credits => 6.0
aine.courses.create :code => 582305, :name_fi => "Symbolinen ohjelmointi", :name_se => "Symbolprogrammering", :name_en => "Symbolic Programming",  :credits => 6.0
syve.courses.create :code => 581354, :name_fi => "Tietokantarakenteet ja -algoritmit", :name_se => "Databasstrukturer och -algoritmer", :name_en => "Database Structures and Algorithms",  :credits => 8.0
syve.courses.create :code => 582404, :name_fi => "Automaattinen verifiointi", :name_se => "Automatisk verifikation", :name_en => "Automatic Verification",  :credits => 6.0
syve.courses.create :code => 582406, :name_fi => "Laajakaistaiset IP-verkot", :name_se => "IP-nät på bredband", :name_en => "Broadband IP Networks",  :credits => 4.0
syve.courses.create :code => 582407, :name_fi => "Software Agent Technology", :name_se => "Agentteknologi för programvaror", :name_en => "Software Agent Technology",  :credits => 4.0
muut.courses.create :code => 582307, :name_fi => "Tietojenkäsittely ihmisessä: hidasta ja tehotonta?", :name_se => "Databehandling i människan: långsamt och ineffektivt?", :name_en => "Human Data Processing. Slow and inefficient?",  :credits => 2.0
muut.courses.create :code => 582501, :name_fi => "Eväitä esiintymisessä onnistumiseen", :name_se => "Vägkost för ett lyckat framträdande", :name_en => "e",  :credits => 2.0
peru.courses.create :code => 580211, :name_fi => "Tietotekniikan alkeet", :name_se => "Introduktion till datateknik", :name_en => "Introduction to Computing",  :credits => 4.0
aine.courses.create :code => 58123, :name_fi => "Tietokoneen toiminta", :name_se => "Datorns function", :name_en => "Computer Systems Organization",  :credits => 6.0
peru.courses.create :code => 581241, :name_fi => "Tekoälykielet", :name_se => "Programspråk för artificiell intelligens", :name_en => "AI Languages",  :credits => 6.0
peru.courses.create :code => 58021, :name_fi => "Atk:n perusteet", :name_se => "Grunderna i ADB", :name_en => "Fundamentals of ADP",  :credits => 4.0
peru.courses.create :code => 58105, :name_fi => "Ohjelmointi (Fortran)", :name_se => "Programmering (Fortran)", :name_en => "Programming (Fortran)",  :credits => 6.0
aine.courses.create :code => 58131, :name_fi => "Tietorakenteet", :name_se => "Datastrukturer", :name_en => "Data Structures",  :credits => 8.0
aine.courses.create :code => 58132, :name_fi => "Rinnakkaisohjelmistot", :name_se => "Parallellprogramvara", :name_en => "Concurrent Systems",  :credits => 8.0
aine.courses.create :code => 58038, :name_fi => "Tiedonhallinta I", :name_se => "Datahantering I", :name_en => "Database Systems I",  :credits => 8.0
aine.courses.create :code => 58172, :name_fi => "Ohjelmistotuotanto", :name_se => "Programvaruproduktion", :name_en => "Software Engineering Laboratory",  :credits => 16.0
aine.courses.create :code => 58110, :name_fi => "Tieteellisen kirjoittamisen kurssi", :name_se => "Att skriva vetenskaplig text", :name_en => "Scientific Writing",  :credits => 10.0
aine.courses.create :code => 58133, :name_fi => "Laskennan teoria", :name_se => "Beräkningsteori", :name_en => "Theory of Computation",  :credits => 8.0
aine.courses.create :code => 58069, :name_fi => "Tietoliikenne", :name_se => "Datakommunikation", :name_en => "Data Communications",  :credits => 8.0
aine.courses.create :code => 58129, :name_fi => "UNIX-sovellusalusta", :name_se => "UNIX för tillämpningar", :name_en => "UNIX Platform",  :credits => 6.0
aine.courses.create :code => 581371, :name_fi => "Hajautettujen ohjelmistojen toteuttaminen", :name_se => "Implementering av parallella system", :name_en => "Implementing concurrent systems",  :credits => 8.0
aine.courses.create :code => 58094, :name_fi => "Ohjelmien semantiikka", :name_se => "Programsemantik", :name_en => "Semantics of Programs",  :credits => 6.0
aine.courses.create :code => 58012, :name_fi => "Yleiskuva atk-alan yhteiskunnallisesta merkityksestä", :name_se => "Översikt av ADB-branschens sociala betydelse", :name_en => "Social Role of ADP",  :credits => 4.0
syve.courses.create :code => 58053, :name_fi => "Algoritmien suunnittelu ja analyysi", :name_se => "Planering och analysering av algoritmer", :name_en => "Design and Analysis of Algorithms",  :credits => 10.0
syve.courses.create :code => 58107, :name_fi => "Tiedonhallinta II", :name_se => "Datahantering II", :name_en => "Database Systems II",  :credits => 10.0
syve.courses.create :code => 581543, :name_fi => "Neuraaliverkot", :name_se => "Neuralnät", :name_en => "Neural Networks",  :credits => 6.0
syve.courses.create :code => 58093, :name_fi => "Merkkijonomenetelmät", :name_se => "Metoder för behandling av teckensträngar", :name_en => "String Processing Algorithms",  :credits => 4.0
syve.courses.create :code => 581374, :name_fi => "Kombinatoriset optimointimenetelmät", :name_se => "Kombinatoriska optimeringsmetoder", :name_en => "Methods in combinatorial optimization",  :credits => 4.0
syve.courses.create :code => 58096, :name_fi => "Hajautetut käyttöjärjestelmät", :name_se => "Distribuerade operativsystem", :name_en => "Distributed Operating Systems",  :credits => 8.0
syve.courses.create :code => 58108, :name_fi => "Rinnakkaiskäsittelyn teoria", :name_se => "Teori för parallell databehandling", :name_en => "Concurrency Theory",  :credits => 8.0
syve.courses.create :code => 58153003, :name_fi => "Ohjelmistojen suorituskyvyn suunnittelu", :name_se => "Prestandaplanering för programvara", :name_en => "Software Performance Engineering",  :credits => 5.0
syve.courses.create :code => 581548, :name_fi => "Tietokoneliikennejärjestelmän mallintaminen ja simulointi", :name_se => "Modellering och simulering av datakommunikationssystem", :name_en => "Modelling and Simulation of Data Communication Systems",  :credits => 4.0
syve.courses.create :code => 581549, :name_fi => "LOTOS-spesifiointikieli", :name_se => "LOTOS-specifieringsspråket", :name_en => "LOTOS Specification Language",  :credits => 6.0
syve.courses.create :code => 58070, :name_fi => "Tietokonearkkitehtuurit", :name_se => "Datorarkitekturer", :name_en => "Computer Architectures",  :credits => 8.0
syve.courses.create :code => 58037, :name_fi => "Tietokoneavusteiset oppimisympäristöt", :name_se => "Datorstödd undervisning", :name_en => "Computer Uses in Education",  :credits => 8.0
syve.courses.create :code => 582405, :name_fi => "Käyttöjärjestelmät II", :name_se => "Operativsystem II", :name_en => "Operating Systems II",  :credits => 4.0
syve.courses.create :code => 581366, :name_fi => "Spesifioinnin ja verifioinnin perusteet", :name_se => "Grunderna i specificering och verifiering", :name_en => "An Introduction to Specification and Verification",  :credits => 4.0
syve.courses.create :code => 581257, :name_fi => "Tiedonhakumenetelmät", :name_se => "Metoder för informationsåtervinning", :name_en => "Information Retrieval Methods",  :credits => 4.0
syve.courses.create :code => 582448, :name_fi => "Tiedon louhinnan menetelmät", :name_se => "Metoder inom kunskapsutvinning", :name_en => "Data Mining Methods",  :credits => 6.0
syve.courses.create :code => 581381, :name_fi => "Käyttöliittymät II", :name_se => "Användargränssnitt II", :name_en => "User Interfaces II",  :credits => 4.0
syve.courses.create :code => 58147, :name_fi => "Koneoppiminen", :name_se => "Maskininlärning", :name_en => "Machine Learning",  :credits => 8.0
syve.courses.create :code => 58144, :name_fi => "Ohjelmointikielten kääntäjät", :name_se => "Kompilatorer", :name_en => "Compilers",  :credits => 4.0
syve.courses.create :code => 582410, :name_fi => "Laajojen dokumenttiaineistojen käsittely", :name_se => "Hantering av stora dokumentmaterial", :name_en => "Processing of Large Document Collections",  :credits => 4.0
syve.courses.create :code => 582471, :name_fi => "Algorithms for segmentation problems", :name_se => "Algorithms for segmentation problems", :name_en => "Algorithms for segmentation problems",  :credits => 4.0
aine.courses.create :code => 582319, :name_fi => "Molecular Genetics and Gene Mapping for Methodological Sciences", :name_se => "Molecular Genetics and Gene Mapping for Methodological Sciences", :name_en => "Molecular Genetics and Gene Mapping for Methodological Sciences",  :credits => 3.0
syve.courses.create :code => 582473, :name_fi => "Linear Algebra Methods for Data Mining", :name_se => "Linear Algebra Methods for Data Mining", :name_en => "Linear Algebra Methods for Data Mining",  :credits => 4.0
syve.courses.create :code => 582465, :name_fi => "Handheld Systems", :name_se => "Handheld Systems", :name_en => "Handheld Systems",  :credits => 4.0
syve.courses.create :code => 582403, :name_fi => "Tietovarastot", :name_se => "Datalager", :name_en => "Data Warehouses",  :credits => 4.0
syve.courses.create :code => 582458, :name_fi => "Kernel Methods for Pattern Analysis", :name_se => "Kernel Methods for Pattern Analysis", :name_en => "Kernel Methods for Pattern Analysis",  :credits => 4.0
syve.courses.create :code => 582463, :name_fi => "Spesifioinnin ja verifioinnin jatkokurssi", :name_se => "r", :name_en => "Spesifioinnin ja verifioinnin jatkokurssi",  :credits => 6.0
aine.courses.create :code => 582320, :name_fi => "Graafisten käyttöliittymien ohjelmointi", :name_se => "Programming Graphical User Interfaces", :name_en => "Programming Graphical User Interfaces",  :credits => 6.0
aine.courses.create :code => 582322, :name_fi => "Pelit ja virtuaaliympäristöt", :name_se => "Pelit ja virtuaaliympäristöt", :name_en => "Pelit ja virtuaaliympäristöt",  :credits => 6.0
syve.courses.create :code => 582462, :name_fi => "Tietoturvan jatkokurssi", :name_se => "Fortsättningskurs i datasekretess", :name_en => "Advanced Course on Computer Security",  :credits => 4.0
syve.courses.create :code => 582474, :name_fi => "Information networks", :name_se => "Information networks", :name_en => "Information networks",  :credits => 6.0
syve.courses.create :code => 582475, :name_fi => "Information Visualization", :name_se => "Information Visualization", :name_en => "Information Visualization",  :credits => 4.0
aine.courses.create :code => 582321, :name_fi => "Digitaalisen äänenkäsittelyn perusteet", :name_se => "r", :name_en => "e",  :credits => 6.0
syve.courses.create :code => 582480, :name_fi => "Machine Learning in Bioinformatics", :name_se => "Machine Learning in Bioinformatics", :name_en => "Machine Learning in Bio-informatics",  :credits => 6.0
syve.courses.create :code => 582476, :name_fi => "Hajautettu tekoäly", :name_se => "Distribuerad artificiell intelligens", :name_en => "Distributed Artificial Intelligence",  :credits => 4.0
syve.courses.create :code => 582477, :name_fi => "Parallel Functional Programming", :name_se => "Parallel Functional Programming", :name_en => "Parallel Functional Programming",  :credits => 2.0
syve.courses.create :code => 582479, :name_fi => "Puhekäyttöliittymien suunnittelu ja toteutus", :name_se => "r", :name_en => "Design and Development of Speech Interfaces",  :credits => 8.0
syve.courses.create :code => 582481, :name_fi => "Causal Analysis", :name_se => "Kausalitetsanalys", :name_en => "Causal Analysis",  :credits => 4.0
peru.courses.create :code => 582101, :name_fi => "Ohjelmistotekniikan menetelmät", :name_se => "Metoder för programvaruteknik", :name_en => "Methods for Software Engineering",  :credits => 4.0
syve.courses.create :code => 582446, :name_fi => "Context-Aware Computing", :name_se => "Context-Aware Computing", :name_en => "Context-Aware Computing",  :credits => 6.0
syve.courses.create :code => 582421, :name_fi => "Satunnaisalgoritmit", :name_se => "r", :name_en => "Randomized Algorithms",  :credits => 8.0
syve.courses.create :code => 58074, :name_fi => "Tietokonegrafiikka", :name_se => "Grafisk databehandling", :name_en => "Computer Graphics",  :credits => 8.0
aine.courses.create :code => 582482, :name_fi => "Tietokannan suunnittelu", :name_se => "Databasplanering", :name_en => "Database Design",  :credits => 4.0
syve.courses.create :code => 581290, :name_fi => "Rakenteisten dokumenttien käsittely", :name_se => "Behandling av strukturerade dokument", :name_en => "Managing Structured Documents",  :credits => 4.0
syve.courses.create :code => 582424, :name_fi => "Tekstiaineistojen tilastosuureita", :name_se => "s", :name_en => "Statistic Quantities in Text Corpora",  :credits => 4.0
peru.courses.create :code => 582102, :name_fi => "Johdatus tietojenkäsittelytieteeseen", :name_se => "Introduktion till datavetenskap", :name_en => "Introduction to Computer Science",  :credits => 4.0
syve.courses.create :code => 582503, :name_fi => "Writing Scientific English", :name_se => "Writing Scientific English", :name_en => "Writing Scientific English",  :credits => 2.0
syve.courses.create :code => 582408, :name_fi => "Lectures on Statistical Modeling Theory", :name_se => "Lectures on Statistical Modeling Theory", :name_en => "Lectures on Statistical Modeling Theory",  :credits => 4.0
syve.courses.create :code => 582411, :name_fi => "Petriverkot", :name_se => "Petrinät", :name_en => "Petri Nets",  :credits => 6.0
syve.courses.create :code => 582413, :name_fi => "Tiedon eristäminen tekstistä", :name_se => "Informationsextrahering ur text", :name_en => "Information extraction in text",  :credits => 4.0
syve.courses.create :code => 582414, :name_fi => "Advanced Networking", :name_se => "Advanced Networking", :name_en => "Advanced Networking",  :credits => 6.0
syve.courses.create :code => 582415, :name_fi => "Advanced Middleware Technologies", :name_se => "Advanced Middleware Technologies", :name_en => "Advanced Middleware Technologies",  :credits => 4.0
syve.courses.create :code => 582416, :name_fi => "Ohjelmistoliiketoimintaprojekti", :name_se => "Projekt för programvarubusiness", :name_en => "Software business project",  :credits => 4.0
aine.courses.create :code => 582308, :name_fi => "Johdatus tietotekniikkaoikeuteen", :name_se => "Introduktion till datarätt", :name_en => "e",  :credits => 2.0
syve.courses.create :code => 582417, :name_fi => "Hajautetut järjestelmät", :name_se => "Distribuerade system", :name_en => "Distributed Systems",  :credits => 4.0
syve.courses.create :code => 581267, :name_fi => "Epätäydellisen tiedon käsittelymenetelmät", :name_se => "Hanteringsmetoder för ofullständing information", :name_en => "Plausible inference with incomplete information",  :credits => 6.0
syve.courses.create :code => 581270, :name_fi => "Kuvankäsittelyn perusteet", :name_se => "Grunderna i bildhantering", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 581284, :name_fi => "Tiedon tiivistäminen", :name_se => "Datakomprimering", :name_en => "e",  :credits => 8.0
peru.courses.create :code => 99270, :name_fi => "Englannin tekstinymmärtäminen", :name_se => "r", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 582418, :name_fi => "Proof Theory and Proof Search", :name_se => "Proof Theory and Proof Search", :name_en => "Proof Theory and Proof Search",  :credits => 4.0
syve.courses.create :code => 582419, :name_fi => "Tekoälyn filosofia", :name_se => "Artificiell intelligensens filosofi", :name_en => "Philosophy of Artificial Intelligence",  :credits => 4.0
syve.courses.create :code => 582422, :name_fi => "Internet Protocols for Mobile Computing", :name_se => "Internet Protocols for Mobile Computing", :name_en => "Internet Protocols for Mobile Computing",  :credits => 4.0
syve.courses.create :code => 582423, :name_fi => "Sanojen distributionaalinen samanlaisuus", :name_se => "s", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 582426, :name_fi => "Tiedon louhinnan algoritmiset menetelmät", :name_se => "Algoritmiska metoder i datautvinning", :name_en => "Advanced algorithms in data mining",  :credits => 4.0
syve.courses.create :code => 582427, :name_fi => "Computational Methods in Gene Mapping and Genome Structure", :name_se => "Computational Methods in Gene Mapping and Genome Structure", :name_en => "Computational Methods in Gene Mapping and Genome Structure",  :credits => 4.0
syve.courses.create :code => 582428, :name_fi => "Wireless Internet Summer School", :name_se => "Wireless Internet Summer School", :name_en => "Wireless Internet Summer School",  :credits => 2.0
syve.courses.create :code => 582429, :name_fi => "Laudatur-projektityö", :name_se => "s", :name_en => "Laudatur Project",  :credits => 6.0
syve.courses.create :code => 582313, :name_fi => "Bioinformatiikan perusteet", :name_se => "r", :name_en => "Elements of Bioinformatics",  :credits => 4.0
syve.courses.create :code => 582438, :name_fi => "Middleware Standards for Mobile Computing", :name_se => "Middleware Standards for Mobile Computing", :name_en => "Middleware Standards for Mobile Computing",  :credits => 4.0
syve.courses.create :code => 582442, :name_fi => "Web-palvelujen arkkitehtuuri", :name_se => "r", :name_en => "Web Services Architecture",  :credits => 6.0
syve.courses.create :code => 582443, :name_fi => "Game Theoretic Concepts in Computer Science", :name_se => "Game Theoretic Concepts in Computer Science", :name_en => "Game Theoretic Concepts in Computer Science",  :credits => 6.0
syve.courses.create :code => 582444, :name_fi => "Special Course on Data Mining", :name_se => "Special Course on Data Mining", :name_en => "Special Course on Data Mining",  :credits => 4.0
syve.courses.create :code => 582445, :name_fi => "Distributed Transaction Management", :name_se => "Distributed Transaction Management", :name_en => "Distributed Transaction Management",  :credits => 6.0
syve.courses.create :code => 582447, :name_fi => "Topics in Computational Biology", :name_se => "Topics in Computational Biology", :name_en => "Topics in Computational Biology",  :credits => 4.0
syve.courses.create :code => 582449, :name_fi => "Peer-to-Peer Computing", :name_se => "Peer-to-Peer Computing", :name_en => "Peer-to-Peer Computing",  :credits => 6.0
syve.courses.create :code => 582452, :name_fi => "Mobiiliohjelmointi", :name_se => "r", :name_en => "Programming Mobile Systems",  :credits => 6.0
syve.courses.create :code => 582453, :name_fi => "Sovellusintegraatio verkostotaloudessa ja sähköisen liiketoiminnan standardit", :name_se => "R", :name_en => "Application integration in a network economy and standards for e-business",  :credits => 8.0
syve.courses.create :code => 582454, :name_fi => "Introduction to Independent Component Analysis", :name_se => "Introduction to Independent Component Analysis", :name_en => "Introduction to Independent Component Analysis",  :credits => 2.0
syve.courses.create :code => 582456, :name_fi => "Approksimointialgoritmit", :name_se => "Approximation Algorithms", :name_en => "Approximation Algorithms",  :credits => 8.0
syve.courses.create :code => 582457, :name_fi => "Classification", :name_se => "Classification", :name_en => "Classification",  :credits => 4.0
syve.courses.create :code => 582460, :name_fi => "Ohjelmistojen vaatimusmäärittely", :name_se => "Kravdefiniering för programvara", :name_en => "Software Requirements Engineering",  :credits => 4.0
aine.courses.create :code => 582316, :name_fi => "Unix-sovellusohjelmointi", :name_se => "r", :name_en => "Unix Application Programming",  :credits => 6.0
peru.courses.create :code => 580214, :name_fi => "Tietotekniikan alkeet", :name_se => "Introduktion till datateknik", :name_en => "Introduction to computing",  :credits => 4.0
peru.courses.create :code => 581222, :name_fi => "Ohjelmointi (Pascal)", :name_se => "Programmering (Pascal)", :name_en => "Programming (Pascal)",  :credits => 8.0
syve.courses.create :code => 581541, :name_fi => "Tapahtumakäsittely", :name_se => "Transaktionsbehandling", :name_en => "Transaction processing",  :credits => 8.0
syve.courses.create :code => 582467, :name_fi => "Data Analysis for Gene Expression", :name_se => "Data Analysis for Gene Expression", :name_en => "Data Analysis for Gene Expression",  :credits => 6.0
syve.courses.create :code => 582468, :name_fi => "Computational Neuroscience", :name_se => "Computational Neuroscience", :name_en => "Computational Neuroscience",  :credits => 6.0
syve.courses.create :code => 582469, :name_fi => "Computational Systems Biology", :name_se => "r", :name_en => "Computational Systems Biology",  :credits => 6.0
muut.courses.create :code => 581324, :name_fi => "Tietokone työvälineenä", :name_se => "Introduktion till datorn som arbetsredskap", :name_en => "Introduction to the Use of Computers",  :credits => 1.0
aine.courses.create :code => 582315, :name_fi => "Johdatus funktionaaliseen ohjelmointiin", :name_se => "Introduktion till funktionell programmering", :name_en => "Introduction to Functional Programming",  :credits => 4.0
syve.courses.create :code => 582461, :name_fi => "Foundations for Future Mobile Computing", :name_se => "Foundations for Future Mobile Computing", :name_en => "Foundations for Future Mobile Computing",  :credits => 8.0
syve.courses.create :code => 582464, :name_fi => "Autonomisten järjestelmien yhteistoiminta", :name_se => "r", :name_en => "Collaboration of Autonomous Business Services",  :credits => 4.0
syve.courses.create :code => 582459, :name_fi => "Semanttinen web", :name_se => "Semantisk web", :name_en => "Semantic web",  :credits => 4.0
aine.courses.create :code => 582314, :name_fi => "Genetics for Computer scientists", :name_se => "Genetics for Computer scientists", :name_en => "Genetics for Computer scientists",  :credits => 4.0
aine.courses.create :code => 581251, :name_fi => "Ohjelmointitekniikka (C++)", :name_se => "Programmeringsteknik (C++)", :name_en => "Software Design (C++)",  :credits => 4.0
syve.courses.create :code => 582455, :name_fi => "Advanced Software Project Management", :name_se => "Advanced Software Project Management", :name_en => "Advanced Software Project Managenent",  :credits => 2.0
aine.courses.create :code => 581365, :name_fi => "Tietokoneen rakenne", :name_se => "Datororganisation II", :name_en => "Computer Organization II",  :credits => 4.0
syve.courses.create :code => 582470, :name_fi => "Empiirinen ohjelmistotutkimus", :name_se => "Experiment i programvaruutveckling", :name_en => "Experimentation in Software Engineering",  :credits => 4.0
muut.courses.create :code => 581256, :name_fi => "Opettajatuutorointi", :name_se => "Lärarhandledning", :name_en => "Tutoring",  :credits => 2.0
muut.courses.create :code => 581355, :name_fi => "Tietojenkäsittelytieteen esittely", :name_se => "Presentation av datavetenskap", :name_en => "Presenting Computer Science",  :credits => 2.0
muut.courses.create :code => 581390, :name_fi => "Tietokone työvälineenä (sivuaineopiskelijoille)", :name_se => "Introduktion till datorn som arbetsredskap", :name_en => "Introduction to the Use of Computers",  :credits => 4.0
peru.courses.create :code => 581328, :name_fi => "Tietokantojen perusteet", :name_se => "Databasernas grunder", :name_en => "Introduction to Databases",  :credits => 4.0
aine.courses.create :code => 581327, :name_fi => "Johdatus sovellussuunnitteluun", :name_se => "Introduktion till applikationsplanering", :name_en => "Introduction to Application Design",  :credits => 4.0
aine.courses.create :code => 581331, :name_fi => "Käyttöjärjestelmät I", :name_se => "Operativsystem", :name_en => "Operating Systems",  :credits => 4.0
aine.courses.create :code => 581332, :name_fi => "Rinnakkaisohjelmointi", :name_se => "Jämlöpande programmering", :name_en => "Concurrent Programming",  :credits => 4.0
aine.courses.create :code => 581334, :name_fi => "Tietokannan hallinta", :name_se => "Databasteknik", :name_en => "Database Management",  :credits => 4.0
aine.courses.create :code => 58127, :name_fi => "C-ohjelmointi", :name_se => "Programmering i C", :name_en => "Programming in C",  :credits => 4.0
aine.courses.create :code => 582304, :name_fi => "XML-metakieli", :name_se => "Metaspråket XML", :name_en => "The metalanguage XML",  :credits => 4.0
aine.courses.create :code => 582310, :name_fi => "Aineenopettajan tietotekniikka", :name_se => "s", :name_en => "IT for Teachers",  :credits => 4.0
syve.courses.create :code => 58066, :name_fi => "Tekoäly", :name_se => "Artificiell intelligens", :name_en => "Artificial Intelligence",  :credits => 8.0
syve.courses.create :code => 581359, :name_fi => "Ohjelmistoprosessit ja ohjelmistojen laatu", :name_se => "Processer och kvalitet för programvara", :name_en => "Software Processes and Quality",  :credits => 4.0
syve.courses.create :code => 581363, :name_fi => "Tietoliikenne II", :name_se => "Datakommunikation II", :name_en => "Data Communications II",  :credits => 4.0
syve.courses.create :code => 581353, :name_fi => "Tietokannan mallinnus", :name_se => "Databasmodellering", :name_en => "Database Modelling",  :credits => 4.0
syve.courses.create :code => 582440, :name_fi => "Sanojen merkitykset", :name_se => "r", :name_en => "The Meaning of Words",  :credits => 4.0
aine.courses.create :code => 581333, :name_fi => "Tietoliikenne I", :name_se => "Datakommunikation I", :name_en => "Data Communications",  :credits => 4.0
aine.courses.create :code => 581391, :name_fi => "Käyttöliittymät", :name_se => "Användargränssnitt", :name_en => "User Interfaces",  :credits => 8.0
aine.courses.create :code => 582302, :name_fi => "Digitaalisen median tekniikat", :name_se => "Digital medieteknik", :name_en => "Digital Media Technology",  :credits => 4.0
aine.courses.create :code => 582309, :name_fi => "Ohjelmointitekniikka (Java)", :name_se => "Programmeringsteknik (Java)", :name_en => "Software Design (Java)",  :credits => 5.0
aine.courses.create :code => 582303, :name_fi => "Verkkosovellusten toteuttaminen", :name_se => "Implementering av nätverksapplikationer", :name_en => "Network Programming",  :credits => 7.0
syve.courses.create :code => 582450, :name_fi => "Modelling of Vision", :name_se => "r", :name_en => "Modelling of Vision",  :credits => 5.0
syve.courses.create :code => 581286, :name_fi => "Kolme käsitettä: informaatio", :name_se => "Tre begrepp: information", :name_en => "Three concepts: information",  :credits => 6.0
syve.courses.create :code => 582466, :name_fi => "Puukieliopit", :name_se => "Trädgrammatiker", :name_en => "Tree Grammars",  :credits => 6.0
syve.courses.create :code => 581372, :name_fi => "Suorituskykyanalyysi", :name_se => "Analysering av prestanda", :name_en => "Performance Analysis",  :credits => 4.0
syve.courses.create :code => 581287, :name_fi => "Kolme käsitettä: todennäköisyys", :name_se => "Tre begrepp: sannolikhet", :name_en => "Three concepts: probability",  :credits => 6.0
syve.courses.create :code => 582420, :name_fi => "Väliohjelmistot", :name_se => "Mellanvara", :name_en => "Middleware",  :credits => 4.0
syve.courses.create :code => 582425, :name_fi => "Tosiaikajärjestelmät", :name_se => "Realtidssystem", :name_en => "Real-Time Systems",  :credits => 4.0
syve.courses.create :code => 582439, :name_fi => "Graphical Models", :name_se => "Graphical Models", :name_en => "Graphical Models",  :credits => 6.0
muut.courses.create :code => 582505, :name_fi => "Äidinkielinen viestintä", :name_se => "r", :name_en => "e",  :credits => 3.0
muut.courses.create :code => 582506, :name_fi => "Tutkimustiedonhaku", :name_se => "r", :name_en => "e",  :credits => 1.0
muut.courses.create :code => 582507, :name_fi => "Henkilökohtainen opintosuunnitelma ja osallistuminen opettajatuutorointiin", :name_se => "r", :name_en => "Personal Study Plan and Participating in Teacher Tutoring",  :credits => 2.0
syve.courses.create :code => 582488, :name_fi => "Models and Algorithms for Complex Networks", :name_se => "Models and Algorithms for Complex Networks", :name_en => "Models and Algorithms for Complex Networks",  :credits => 6.0
syve.courses.create :code => 582494, :name_fi => "Probabilistic Logic Learning", :name_se => "Probabilistic Logic Learning", :name_en => "Probabilistic Logic Learning",  :credits => 4.0
syve.courses.create :code => 582495, :name_fi => "Component-Based Development", :name_se => "Component-Based Development", :name_en => "Component-Based Development",  :credits => 8.0
syve.courses.create :code => 581339, :name_fi => "Kolme käsitettä: päätöksenteko", :name_se => "Tre begrepp: beslutsfattning", :name_en => "Three concepts: utility",  :credits => 6.0
syve.courses.create :code => 581380, :name_fi => "Computational Complexity", :name_se => "Komplexitetsteori", :name_en => "Computational Complexity",  :credits => 8.0
aine.courses.create :code => 582204, :name_fi => "Kandidaatintutkielma", :name_se => "r", :name_en => "BSc Thesis (Scientific Writing)",  :credits => 10.0
aine.courses.create :code => 582317, :name_fi => "Linux-ylläpito", :name_se => "r", :name_en => "Linux System Administration",  :credits => 6.0
syve.courses.create :code => 582496, :name_fi => "Mobile Web Services", :name_se => "Mobile Web Services", :name_en => "Mobile Web Services",  :credits => 6.0
peru.courses.create :code => 581242, :name_fi => "Tietojenkäsittelyn menetelmiä", :name_se => "Metoder inom databehandling", :name_en => "Computing Methodologies",  :credits => 6.0
syve.courses.create :code => 58097, :name_fi => "Graafisen tietojenkäsittelyn jatkokurssi", :name_se => "Fortsättningskurs i grafisk databehandling", :name_en => "Advanced Computer Graphics",  :credits => 8.0
syve.courses.create :code => 582612, :name_fi => "Practical Course in Microarray Data Analysis", :name_se => "Practical Course in Microarray Data Analysis", :name_en => "Practical Course in Microarray Data Analysis",  :credits => 4.0
syve.courses.create :code => 582483, :name_fi => "Biological Sequence Analysis", :name_se => "r", :name_en => "Biological Sequence Analysis",  :credits => 4.0
aine.courses.create :code => 582201, :name_fi => "Käyttöliittymät", :name_se => "Användargränsnitt", :name_en => "User Interfaces",  :credits => 4.0
syve.courses.create :code => 582484, :name_fi => "Algorithm Libraries", :name_se => "Algoritmbibliotek", :name_en => "Algorithm Libraries",  :credits => 4.0
syve.courses.create :code => 582485, :name_fi => "Algorithm Library Design", :name_se => "Planering av algoritmbibliotek", :name_en => "Algorithm Library Design",  :credits => 4.0
syve.courses.create :code => 582486, :name_fi => "Convex Optimization", :name_se => "r", :name_en => "Convex Optimization",  :credits => 8.0
syve.courses.create :code => 582487, :name_fi => "Tiedon tiivistämisen tekniikat", :name_se => "r", :name_en => "Data Compression Techniques",  :credits => 4.0
syve.courses.create :code => 582412, :name_fi => "Kuvankäsittely", :name_se => "Bildhantering", :name_en => "Image Processing",  :credits => 6.0
aine.courses.create :code => 582202, :name_fi => "Tietoliikenteen perusteet", :name_se => "Introduktion till datakommunikation", :name_en => "Introduction to Data Communication",  :credits => 4.0
syve.courses.create :code => 582489, :name_fi => "Verkkojen tietoturva", :name_se => "r", :name_en => "Network Security",  :credits => 4.0
aine.courses.create :code => 582323, :name_fi => "Paikkatiedon käsittely", :name_se => "Hantering av geografisk information", :name_en => "Spatial Data Processing",  :credits => 5.0
syve.courses.create :code => 582490, :name_fi => "Transaktioiden hallinta", :name_se => "Transaktionsbehandling", :name_en => "Transaction Processing",  :credits => 4.0
syve.courses.create :code => 582491, :name_fi => "Hajautetut tietokannat", :name_se => "Distribuerade databaser", :name_en => "Distributed Databases",  :credits => 4.0
syve.courses.create :code => 582492, :name_fi => "Symbolisesti koodatun musiikin hakumenetelmät", :name_se => "r", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 582493, :name_fi => "Advanced Topics in Databases", :name_se => "Advanced Topics in Databases", :name_en => "Advanced Topics in Databases",  :credits => 4.0
syve.courses.create :code => 582614, :name_fi => "Tekoäly tietokonepeleissä", :name_se => "Artificiell intelligens för spel", :name_en => "Artificial Intelligence for Games",  :credits => 4.0
aine.courses.create :code => 582325, :name_fi => "Johdatus peliohjelmointiin", :name_se => "Inledning till spelprogrammering", :name_en => "Introduction to game programming",  :credits => 4.0
syve.courses.create :code => 582615, :name_fi => "Peer-to-Peer Networks", :name_se => "Overlay and P2P Networks", :name_en => "Peer-to-Peer Networks",  :credits => 4.0
syve.courses.create :code => 582616, :name_fi => "Algoritmien suunnittelu II", :name_se => "Konstruktion av algoritmer II", :name_en => "Design of Algorithms II",  :credits => 4.0
syve.courses.create :code => 582617, :name_fi => "Ohjelmistojen suunnittelu", :name_se => "Planering av programvara", :name_en => "Software Design",  :credits => 5.0
syve.courses.create :code => 582618, :name_fi => "Proteomics and Bioinformatics", :name_se => "Proteomics and Bioinformatics", :name_en => "Proteomics and Bioinformatics",  :credits => 2.0
syve.courses.create :code => 581274, :name_fi => "Paikkatietojärjestelmät", :name_se => "Geografiska informationssystem", :name_en => "Spatial Information Systems",  :credits => 4.0
syve.courses.create :code => 582409, :name_fi => "Variational Methods in Intelligent Systems", :name_se => "Variational Methods in Intelligent Systems", :name_en => "Variational Methods in Intelligent Systems",  :credits => 4.0
aine.courses.create :code => 582311, :name_fi => "Scheme-harjoituskurssi", :name_se => "s", :name_en => "e",  :credits => 4.0
syve.courses.create :code => 582441, :name_fi => "Kombinatorinen optimointi", :name_se => "r", :name_en => "Combinatorial Optimization",  :credits => 10.0
aine.courses.create :code => 582206, :name_fi => "Laskennan mallit", :name_se => "Beräkningsmodeller", :name_en => "Models of Computation",  :credits => 6.0
syve.courses.create :code => 582601, :name_fi => "XML-tietokannat", :name_se => "XML-databaser", :name_en => "XML Databases",  :credits => 4.0
syve.courses.create :code => 582602, :name_fi => "Natural Language Processing", :name_se => "Hantering av naturligt språk", :name_en => "Natural Language Processing",  :credits => 8.0
aine.courses.create :code => 582324, :name_fi => "Kyselykielet", :name_se => "Frågespråk", :name_en => "Query Languages",  :credits => 4.0
syve.courses.create :code => 582608, :name_fi => "Internet Technologies for Mobile Computing", :name_se => "Internet Technologies for Mobile Computing", :name_en => "Internet Technologies for Mobile Computing",  :credits => 4.0
aine.courses.create :code => 582214, :name_fi => "Pelit ja kerronta -luentosarja", :name_se => "r", :name_en => "Lecturer Series on Games and Storytelling",  :credits => 2.0
syve.courses.create :code => 582499, :name_fi => "Aspect Oriented Programming", :name_se => "Aspect Oriented Programming", :name_en => "Aspect Oriented Programming",  :credits => 2.0
syve.courses.create :code => 582600, :name_fi => "Spatial Data Mining", :name_se => "Utvinning av geografisk information", :name_en => "Spatial Data Mining",  :credits => 4.0
aine.courses.create :code => 582207, :name_fi => "Algoritmien suunnittelu", :name_se => "Planering av algoritmer", :name_en => "Design of Algorithms",  :credits => 4.0
syve.courses.create :code => 582604, :name_fi => "Practical Course in Biodatabases", :name_se => "Practical Course in Biodatabases", :name_en => "Practical Course in Biodatabases",  :credits => 4.0
aine.courses.create :code => 582211, :name_fi => "Peliohjelmointi", :name_se => "Spelprogrammering", :name_en => "Game Programming",  :credits => 6.0
syve.courses.create :code => 582607, :name_fi => "Protocol Software Engineering", :name_se => "Protocol Software Engineering", :name_en => "Protocol Software Engineering",  :credits => 6.0
aine.courses.create :code => 582213, :name_fi => "Laskennallinen data-analyysi II", :name_se => "r", :name_en => "Computational Data Analysis II",  :credits => 4.0
syve.courses.create :code => 582498, :name_fi => "Internet-protokollat", :name_se => "r", :name_en => "Internet Protocols",  :credits => 4.0
syve.courses.create :code => 582497, :name_fi => "Käyttöjärjestelmät", :name_se => "r", :name_en => "Operating Systems",  :credits => 8.0
aine.courses.create :code => 582208, :name_fi => "Laskennan vaativuus", :name_se => "r", :name_en => "Complexity of Computation",  :credits => 4.0
aine.courses.create :code => 582209, :name_fi => "Grafiikkaohjelmointi", :name_se => "Grafikprogrammering", :name_en => "Graphics Programming",  :credits => 4.0
syve.courses.create :code => 582603, :name_fi => "Advanced Data Structures", :name_se => "Avancerade datastrukturer", :name_en => "Advanced Data Structures",  :credits => 4.0
syve.courses.create :code => 582605, :name_fi => "Metabolic Modeling", :name_se => "Metabolic Modeling", :name_en => "Metabolic Modeling",  :credits => 4.0
aine.courses.create :code => 582210, :name_fi => "Digitaalisten pelien perusteet", :name_se => "Grundkurs i digital spell", :name_en => "Foundations of Digital Games",  :credits => 4.0
syve.courses.create :code => 582606, :name_fi => "Introduction to Bioinformatics", :name_se => "Introduction to Bioinformatics", :name_en => "Introduction to Bioinformatics",  :credits => 4.0
aine.courses.create :code => 582212, :name_fi => "Laskennallinen data-analyysi I", :name_se => "r", :name_en => "Computational Data Analysis I",  :credits => 4.0
syve.courses.create :code => 582609, :name_fi => "Advances in Data Mining", :name_se => "Advances in Data Mining", :name_en => "Advances in Data Mining",  :credits => 2.0
syve.courses.create :code => 582610, :name_fi => "Performance Issues in Mobile Computing and Communication", :name_se => "Performance Issues in Mobile Computing and Communication", :name_en => "Performance Issues in Mobile Computing and Communication",  :credits => 4.0
syve.courses.create :code => 582611, :name_fi => "Peliohjelmointi", :name_se => "Spelprogrammering", :name_en => "Game Programming",  :credits => 6.0
syve.courses.create :code => 582661, :name_fi => "Deterministisiä hajautettuja algoritmeja", :name_se => "r", :name_en => "Deterministic Distributed Algorithms",  :credits => 3.0
aine.courses.create :code => 582337, :name_fi => "AI for Games II", :name_se => "AI for Games II", :name_en => "AI for Games II",  :credits => 3.0
syve.courses.create :code => 582663, :name_fi => "Ohjelmistoarkkitehtuurien harjoitustyö", :name_se => "r", :name_en => "Software Architecture Project",  :credits => 3.0
syve.courses.create :code => 582672, :name_fi => "PSIRP Codecamp", :name_se => "PSIRP Codecamp", :name_en => "PSIRP Codecamp",  :credits => 2.0
syve.courses.create :code => 582673, :name_fi => "Laskennallinen genotyyppi-analyysi", :name_se => "r", :name_en => "Computational Genotype Analysis",  :credits => 4.0
syve.courses.create :code => 582631, :name_fi => "Johdatus koneoppimiseen", :name_se => "Introduktion till maskininlärning", :name_en => "Introduction to Machine Learning",  :credits => 4.0
syve.courses.create :code => 582634, :name_fi => "Tiedon louhinta", :name_se => "Datautvinning", :name_en => "Data Mining",  :credits => 4.0
syve.courses.create :code => 582636, :name_fi => "Todennäköisyysmallit", :name_se => "Sannolikhetsmodeller", :name_en => "Probabilistic Models",  :credits => 4.0
syve.courses.create :code => 582638, :name_fi => "Unsupervised Machine Learning", :name_se => "Unsupervised Machine Learning", :name_en => "Unsupervised Machine Learning",  :credits => 4.0
aine.courses.create :code => 582640, :name_fi => "Käyttöjärjestelmät", :name_se => "r", :name_en => "Operating Systems",  :credits => 4.0
muut.courses.create :code => 582513, :name_fi => "Opiskelutekniikka", :name_se => "Opiskelutekniikka", :name_en => "Opiskelutekniikka",  :credits => 2.0
muut.courses.create :code => 584402, :name_fi => "Harjoittelu tai työelämään orientoituminen", :name_se => "Harjoittelu tai työelämään orientoituminen", :name_en => "Harjoittelu tai työelämään orientoituminen",  :credits => 1.0
syve.courses.create :code => 582721, :name_fi => "Tutkimusetiikka", :name_se => "Tutkimusetiikka", :name_en => "Research Ethics - Everyday Questions for Researchers",  :credits => 1.0
muut.courses.create :code => 99501, :name_fi => "English Academic & Professional Skills: Reading, Writing &>> Spoken Communication (CEFR B2)", :name_se => "English Academic & Professional Skills: Reading, Writing &>> Spoken Communication (CEFR B2)", :name_en => "English Academic & Professional Skills: Reading, Writing &>> Spoken Communication (CEFR B2)",  :credits => 4.0
syve.courses.create :code => 582660, :name_fi => "Käytettävyyden arviointi", :name_se => "r", :name_en => "Usability Evaluation",  :credits => 4.0
syve.courses.create :code => 582664, :name_fi => "Overlay and P2P Networks", :name_se => "Overlay and P2P Networks", :name_en => "Overlay and P2P Networks",  :credits => 4.0
syve.courses.create :code => 582665, :name_fi => "Distributed Systems Project", :name_se => "Distributed Systems Project", :name_en => "Distributed Systems Project",  :credits => 4.0
syve.courses.create :code => 582667, :name_fi => "Business Process Automation", :name_se => "Business Process Automation", :name_en => "Business Process Automation",  :credits => 4.0
syve.courses.create :code => 582668, :name_fi => "Merkkijonomenetelmien harjoitustyö", :name_se => "r", :name_en => "Project in String Processing Algorithms",  :credits => 2.0
syve.courses.create :code => 582670, :name_fi => "Algoritmit bioinformatiikassa", :name_se => "r", :name_en => "Algorithms for Bioinformatics",  :credits => 4.0
muut.courses.create :code => 582517, :name_fi => "Orientation to MSc Studies", :name_se => "Orientation to MSc Studies", :name_en => "Orientation to MSc Studies",  :credits => 2.0
syve.courses.create :code => 582671, :name_fi => "Graph Mining - Motivation, Algorithms and Applications", :name_se => "Graph Mining - Motivation, Algorithms and Applications", :name_en => "Graph Mining - Motivation, Algorithms and Applications",  :credits => 2.0
syve.courses.create :code => 582649, :name_fi => "Complex Networks and Data Mining", :name_se => "Complex Networks and Data Mining", :name_en => "Complex Networks and Data Mining",  :credits => 4.0
syve.courses.create :code => 582651, :name_fi => "Informaatioteoreettisen mallintamisen harjoitustyö", :name_se => "Projekt i informationssteoretisk modellering", :name_en => "Project in Information-Theoretic Modeling",  :credits => 2.0
aine.courses.create :code => 582331, :name_fi => "Ketterä web-kehitys ja Ruby on Rails", :name_se => "r", :name_en => "Agile Web Development and Ruby on Rails",  :credits => 4.0
syve.courses.create :code => 582642, :name_fi => "Palvelusuuntautunut ohjelmistotuotanto", :name_se => "r", :name_en => "Service-Oriented Software Engineering",  :credits => 4.0
syve.courses.create :code => 582724, :name_fi => "Making good decisions: Introduction to ethics and social responsibility in research", :name_se => "Making good decisions: Introduction to ethics and social responsibility in research", :name_en => "Making good decisions: Introduction to ethics and social responsibility in research",  :credits => 3.0
syve.courses.create :code => 582653, :name_fi => "Computational Methods of Systems Biology", :name_se => "Computational Methods of Systems Biology", :name_en => "Computational Methods of Systems Biology",  :credits => 4.0
aine.courses.create :code => 582332, :name_fi => "Ohjelmointi Python-kielellä", :name_se => "r", :name_en => "Programming in Python",  :credits => 4.0
aine.courses.create :code => 582334, :name_fi => "TDD-ohjelmointimenetelmä ja koodin suunnittelu", :name_se => "r", :name_en => "TDD Programming Technique and Designing Code",  :credits => 5.0
aine.courses.create :code => 582215, :name_fi => "Tietoturvan perusteet", :name_se => "r", :name_en => "Introduction to Computer Security",  :credits => 4.0
syve.courses.create :code => 582656, :name_fi => "Käytettävyyssuunnittelu", :name_se => "Användbarhetsdesign", :name_en => "Usability Engineering",  :credits => 4.0
syve.courses.create :code => 582662, :name_fi => "Game Engine Architecture", :name_se => "Game Engine Architecture", :name_en => "Game Engine Architecture",  :credits => 6.0
aine.courses.create :code => 582338, :name_fi => "Introduction to Software Testing", :name_se => "Introduction to Software Testing", :name_en => "Introduction to Software Testing",  :credits => 4.0
muut.courses.create :code => 582516, :name_fi => "Software Factory Work Experience", :name_se => "Software Factory Work Experience", :name_en => "Software Factory Work Experience",  :credits => 5.0
syve.courses.create :code => 582619, :name_fi => "Sensing, Actuation, and Computation", :name_se => "Sensing, Actuation, and Computation", :name_en => "Sensing, Actuation, and Computation",  :credits => 6.0
syve.courses.create :code => 582641, :name_fi => "Autonomisten järjestelmien yhteistoiminta", :name_se => "Autonomisten järjestelmien yhteistoiminta", :name_en => "Collaboration of Autonomous Business Services",  :credits => 4.0
syve.courses.create :code => 582643, :name_fi => "Programming in Scala", :name_se => "Programming in Scala", :name_en => "Programming in Scala",  :credits => 4.0
muut.courses.create :code => 582510, :name_fi => "Henkilökohtainen opintosuunnitelma (FM-HOPS)", :name_se => "Henkilökohtainen opintosuunnitelma (FM-HOPS)", :name_en => "Henkilökohtainen opintosuunnitelma (FM-HOPS)",  :credits => 1.0
syve.courses.create :code => 582646, :name_fi => "Mobile Middleware", :name_se => "Mobile Middleware", :name_en => "Mobile Middleware",  :credits => 3.0
muut.courses.create :code => 582515, :name_fi => "Tietotekniikka-ala ammattina", :name_se => "r", :name_en => "Information Technology as a Profession",  :credits => 2.0
syve.courses.create :code => 582666, :name_fi => "Interactive Systems", :name_se => "Interactive Systems", :name_en => "Interactive Systems",  :credits => 4.0
syve.courses.create :code => 582669, :name_fi => "Ohjattu koneoppiminen", :name_se => "Supervised Machine Learning", :name_en => "Supervised Machine Learning",  :credits => 4.0
aine.courses.create :code => 582339, :name_fi => "Internet ilmiönä", :name_se => "r", :name_en => "Internet as a Phenomenon",  :credits => 2.0
syve.courses.create :code => 582621, :name_fi => "Milestones in Operating Systems", :name_se => "Milestones in Operating Systems", :name_en => "Milestones in Operating Systems",  :credits => 4.0
syve.courses.create :code => 582645, :name_fi => "Software Quality, Processes, and Organizations", :name_se => "Software Quality, Processes, and Organizations", :name_en => "Software Quality, Processes, and Organizations",  :credits => 6.0
aine.courses.create :code => 582218, :name_fi => "Johdatus lambda-kalkyyliin", :name_se => "r", :name_en => "Introduction to Lambda Calculus",  :credits => 2.0
peru.courses.create :code => 582103, :name_fi => "Ohjelmoinnin jatkokurssi", :name_se => "r", :name_en => "Advanced Course in Programming",  :credits => 4.0
peru.courses.create :code => 582104, :name_fi => "Ohjelmistojen mallintaminen", :name_se => "r", :name_en => "Software Modelling",  :credits => 4.0
aine.courses.create :code => 582216, :name_fi => "Johdatus tekoälyyn", :name_se => "r", :name_en => "Introduction to Artificial Intelligence",  :credits => 4.0
syve.courses.create :code => 582217, :name_fi => "Semanttinen web", :name_se => "r", :name_en => "Semantic Web",  :credits => 4.0
syve.courses.create :code => 582630, :name_fi => "Algoritmien suunnittelu ja analyysi", :name_se => "Konstruktion och analys av algoritmer", :name_en => "Design and Analysis of Algorithms",  :credits => 4.0
syve.courses.create :code => 582632, :name_fi => "Diskreetti optimointi", :name_se => "Diskret optimering", :name_en => "Discrete optimization",  :credits => 4.0
syve.courses.create :code => 582633, :name_fi => "Diskreetin optimoinnin harjoitustyö", :name_se => "Övningsarbete i diskret optimering", :name_en => "Discrete Optimization Project",  :credits => 2.0
syve.courses.create :code => 582635, :name_fi => "Tiedon louhinnan harjoitustyö", :name_se => "Övningsarbete i datautvinning", :name_en => "Data Mining Project",  :credits => 2.0
syve.courses.create :code => 582637, :name_fi => "Todennäköisyysmallien harjoitustyö", :name_se => "Övningsarbete i sannolikhetsmodeller", :name_en => "Project in Probabilistic Models",  :credits => 2.0
muut.courses.create :code => 582710, :name_fi => "Jatko-opintoseminaari", :name_se => "r", :name_en => "PhD Student Seminar",  :credits => 1.0
muut.courses.create :code => 582514, :name_fi => "TVT-ajokortti", :name_se => "TVT-ajokortti", :name_en => "TVT-ajokortti",  :credits => 3.0
syve.courses.create :code => 582650, :name_fi => "Informaatioteoreettinen mallintaminen", :name_se => "Informationsteoretisk modellering", :name_en => "Information-Theoretic Modeling",  :credits => 4.0
aine.courses.create :code => 582330, :name_fi => "Ohjelmointitekniikka (Scala)", :name_se => "r", :name_en => "Software Design (Scala)",  :credits => 4.0
syve.courses.create :code => 582652, :name_fi => "Palveluperustaisten liiketoimintaprosessien suunnittelu ja toteuttaminen", :name_se => "r", :name_en => "Designing and Implementing Service-Oriented Business Processes",  :credits => 4.0
syve.courses.create :code => 582644, :name_fi => "Short Course in Parallel Programming Using MPI", :name_se => "Short Course in Parallel Programming Using MPI", :name_en => "Short Course in Parallel Programming Using MPI",  :credits => 2.0
syve.courses.create :code => 582647, :name_fi => "Graph Mining", :name_se => "Graph Mining", :name_en => "Graph Mining",  :credits => 3.0
syve.courses.create :code => 582648, :name_fi => "Ohjelmointikielten kääntäjien harjoitustyö", :name_se => "r", :name_en => "Compilers Project",  :credits => 4.0
aine.courses.create :code => 582329, :name_fi => "AI for Games", :name_se => "AI for Games", :name_en => "AI for Games",  :credits => 3.0
syve.courses.create :code => 582654, :name_fi => "Assignment in Mobile Middleware", :name_se => "Assignment in Mobile Middleware", :name_en => "Assignment in Mobile Middleware",  :credits => 2.0
syve.courses.create :code => 582655, :name_fi => "Formal Type Theory", :name_se => "Formal Type Theory", :name_en => "Formal Type Theory",  :credits => 4.0
aine.courses.create :code => 582335, :name_fi => "Versionhallinta", :name_se => "r", :name_en => "Version Control",  :credits => 1.0
syve.courses.create :code => 582657, :name_fi => "QT CodeCamp", :name_se => "QT CodeCamp", :name_en => "QT CodeCamp",  :credits => 3.0
syve.courses.create :code => 57734, :name_fi => "Modelling inheritance in pedigrees and populations", :name_se => "Modelling inheritance in pedigrees and populations", :name_en => "Modelling inheritance in pedigrees and populations",  :credits => 4.0
syve.courses.create :code => 582620, :name_fi => "Intensive Course on Modeling Biological Networks", :name_se => "Intensive Course on Modeling Biological Networks", :name_en => "Intensive Course on Modeling Biological Networks",  :credits => 5.0
muut.courses.create :code => 584403, :name_fi => "Syventävä harjoittelu tai työelämään orientoivat opinnot", :name_se => "Syventävä harjoittelu tai työelämään orientoivat opinnot", :name_en => "Syventävä harjoittelu tai työelämään orientoivat opinnot",  :credits => 2.0
syve.courses.create :code => 582639, :name_fi => "Special Topics in Computational Geometry: Motion Planning and ShapeApproxim", :name_se => "Special Topics in Computational Geometry: Motion Planning and Shape Approximation", :name_en => "Special Topics in Computational Geometry: Motion Planning and Shape Approximation",  :credits => 3.0
syve.courses.create :code => 582658, :name_fi => "Performance Modelling for Wireless Data Communication", :name_se => "Performance Modelling for Wireless Data Communication", :name_en => "Performance Modelling for Wireless Data Communication",  :credits => 2.0
syve.courses.create :code => 582659, :name_fi => "Software Factory Project", :name_se => "Software Factory Project", :name_en => "Software Factory Project",  :credits => 5.0
aine.courses.create :code => 582336, :name_fi => "Introduction to Go", :name_se => "Introduction to Go", :name_en => "Introduction to Go",  :credits => 3.0
#     perusopinnot = Level.create :name_fi => 'Perusopinnot'
#     aineopinnot = Level.create :name_fi => 'Aineopinnot'
#     syventävätopinnot = Level.create :name_fi => 'Syventävät opinnot'
#     muutopinnot = Level.create :name_fi => 'Muut opinnot'

     erilliskoe = Type.create :name_fi => 'Erilliskoe'
     kurssikoe = Type.create :name_fi => 'Kurssikoe'
     uusintakoe = Type.create :name_fi => 'Uusintakoe'

     kesa = Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => kurssikoe.id, :date => Date.new(2010, 6, 12), :maximum_points => 50, :language => 'fi'
     Course.find_by_code(581325).exams.create :lecturer => 2, :type_id => erilliskoe.id, :date => Date.new(2010, 6, 1), :maximum_points => 60
     Course.find_by_code(581325).exams.only_public.create :lecturer => 2, :type_id => uusintakoe.id, :date => Date.new(2010, 8, 30), :maximum_points => 50

     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => erilliskoe.id , :date => Date.new(2010, 6, 4), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => kurssikoe.id , :date => Date.new(2009, 10 , 22), :maximum_points => 60
     Course.find_by_code(582206).exams.create :lecturer => 3, :type_id => uusintakoe.id , :date => Date.new(2010, 1, 22), :maximum_points => 60

     Course.find_by_code(582313).exams.create :lecturer => 4, :type_id => kurssikoe.id , :date => Date.new(2009, 10, 21), :maximum_points => 60

     kesa.questions.create :number => 1 , :name => %&Selitä lyhyesti ja selkeästi käsitteet parametri, konstruktori, aksessori, kapselointi&, :description => "", :points => 16
     kesa.questions.create :number => 2 , :description => %&* public OliiviOljyAsema (double pääsailiö, double varastosailio) luo oliiviöljyaseman, jonka säiliöiden vetoisuudet annetaan parametreina. Jos vetoisuus on virheellinen, säiliön kooksi asetetaan 100 litraa. Molemmat säiliöt ovat aluksi tyhjiä.

    * public double getPaa() palauttaa tiedon pääsäiliön öljymäärästä
    * public double getVara() palauttaa tiedon varastosäiliön öljymäärästä
    * public double getYht() palauttaa tiedon aseman koko öljymäärästä

    * public boolean lisaaOljya(double maara) lisää öljyä pääsäiliöön. Jos yritetään lisätä enemmän kuin pääsäiliöön mahtuu, ylimääräinen öljy pumpataan varastosäiliöön. Jos koko lisättävä määrä ei mahtu säiliöihin, öljyn määrää kummassakaan säiliössä ei muuteta. Metodi palauttaa arvon true, jos lisäys onnistui, muuten false.

    * public double otaOljya(double maara) ottaa öljyä pääsäiliöstä. Jos pyydetään enemmän kuin pääsäiliössä on, öljyä siirretään automaattisesti varastosäiliöstä pääsäiliöön. Jos edes molempien säiliöiden öljy ei riitä, annetaan mitä voidaan. Metodi palauttaa arvonaan saadun öljyn määrän.

    * public String toString() palauttaa arvonaan selkeän merkkijonoesityksen oliiviöljyaseman tilasta 

Havainnollista OliiviOljyAsema-luokan käyttöä pienellä pääohjelmalla. Tämän ohjelman ei tarvitse eikä ole syytä lukea mitään.&, :name => %&Oliiviöljyasemalla on kaksi öljysäiliötä. Vain pääsäiliöön voidaan suoraan lisätä öljyä ja vain pääsäiliöstä asiakas voi tankata öljyä. Toinen säiliö on varastosäiliö, jota käytetään automaattisesti hyväksi, kun ensimmäisen säiliön kapasiteetti ei riitä. Laadi luokka OliiviOljyAsema oliiviöljyaseman toteutukseksi.&, :points => 17
     kesa.questions.create :number => 3 , :description => %&Ennen pelin alkua pelinjohtaja syöttää ohjelmalle sata kokonaislukua satunnaisessa järjestyksessä.  Luvut saavat olla mitä tahansa kokonaislukuja. Sama luku saa esiintyä useammankin kerran.

Tämän jälkeen pelaaja alkaa käyttää ohjelmaa. Pelaaja yrittää arvata pelinjohtajan koneeseen syöttämiä lukuja. Peli päättyy, kun pelaaja onnistuu arvaamaan jonkin pelinjohtajan syöttämän luvun. Pelin tulos on tarvittujen arvausten määrä, jonka ohjelma lopuksi tulostaa.

Saat olettaa, että kaikki syötetyt luvut ovat kelvollisia kokonaislukuja.

Arvattavien lukujen hakeminen on tehokkuussyistä ohjelmoitava binäärihakua käyttäen. &, :name => %&Toteuta seuraava arvauspeli vuorovaikutteisena ohjelmana:&, :points => 17

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

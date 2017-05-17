-- phpMyAdmin SQL Dump
-- version 4.4.15.8
-- https://www.phpmyadmin.net
--
-- Host: localhost
-- Creato il: Mag 05, 2017 alle 15:38
-- Versione del server: 5.6.31
-- Versione PHP: 5.5.38

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `my_testr`
--

-- --------------------------------------------------------

--
-- Struttura della tabella `Accesso`
--

CREATE TABLE IF NOT EXISTS `Accesso` (
  `id` int(11) NOT NULL,
  `username` varchar(25) COLLATE utf8_roman_ci NOT NULL,
  `passcode` varchar(25) COLLATE utf8_roman_ci NOT NULL,
  `amministrazione` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `Accesso`
--

INSERT INTO `Accesso` (`id`, `username`, `passcode`, `amministrazione`) VALUES
(1, 'paolino.paperino', 'quack', 1);

-- --------------------------------------------------------

--
-- Struttura della tabella `Evento`
--

CREATE TABLE IF NOT EXISTS `Evento` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) NOT NULL,
  `durata` int(11) NOT NULL,
  `tipologia` int(11) NOT NULL COMMENT 'FK to tipologiaEvento(id)',
  `eta_min` int(2) NOT NULL DEFAULT '0',
  `eta_max` int(3) NOT NULL DEFAULT '0',
  `ticket` tinyint(1) NOT NULL,
  `speciale_ragazzi` tinyint(1) NOT NULL DEFAULT '0',
  `descrizione_ita` text NOT NULL,
  `descrizione_eng` text CHARACTER SET utf8 COLLATE utf8_roman_ci NOT NULL,
  `foto` varchar(255) DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

--
-- Dump dei dati per la tabella `Evento`
--

INSERT INTO `Evento` (`id`, `nome`, `durata`, `tipologia`, `eta_min`, `eta_max`, `ticket`, `speciale_ragazzi`, `descrizione_ita`, `descrizione_eng`, `foto`) VALUES
(1, 'Rumore di Acque', 60, 1, 13, 99, 0, 0, 'Il protagonista è un moderno Caronte “catalogatore” con tanto\ndi divisa da ammiraglio cibernauta. Unico abitante di “un’isoletta\ndell’accoglimento” ha il compito di numerare le storie di chi voleva\narrivare lontano e si è perso nelle acque del Mediterraneo.', 'An intense show about\nthe stories of people who\nwanted to go far but got lost\nETÀ in the Mediterranean Sea.', '../..//App/img/evento/Desert.jpg'),
(3, 'MYLOEMAYA', 50, 1, 3, 5, 1, 0, 'Un lungo tavolo bianco e due curiosi personaggi che inventano un nuovo modo di  apparecchiare dove tutto diventa musica, canto, gioco. Ogni stoviglia è un suono per uno spettacolo di teatro musicale ed esperienza tattile che permette di avvicinare i più piccoli al mondo  dell’opera lirica. Da ascoltare insieme,  \nda cantare insieme.', 'A table set becomes a sound art installation to be explored and listened to.', '../..//App/img/evento/Chrysanthemum.jpg'),
(4, 'Il Giardino di Gaia', 45, 1, 1, 5, 1, 0, 'Un viaggio teatrale nella natura. Farfalle, piccoli alberi, fiori, specchi d’acqua, uova magiche, pesci volanti, passano dalle mani delle attrici a quelle dei bambini mentre un giardino accogliente si trasforma col passare delle stagioni.', 'A theatrical trip into nature with the keepers\nof a cozy garden which keeps changing and\nevolving throughout seasons.', ''),
(5, 'Buio', 45, 1, 2, 5, 1, 0, 'Uno spettacolare percorso sensoriale ed emotivo\nfra luce e buio in cui i piccolissimi possono\nperdersi e ritrovarsi, diventando “spett-attori“\ndi un viaggio di scoperta e conoscenza. Uno\nspettacolo interattivo che dimostra come scoprire\ncon semplicità le leggi fisiche partendo dal gioco.', 'An extraordinary sensory and emotional\ntrip between light and darkness explains\nphysical laws to young children.', ''),
(6, 'Semino', 45, 1, 2, 6, 1, 0, 'Tra l‘attesa e l‘accadere c’è la cura, come quella\nper un seme che deve schiudersi e che diventa\nmetafora della crescita, dell’apertura verso la\nvita a partire dalla relazione con l’altro. Uno\nspettacolo di educazione sentimentale per\nsentire la natura come parte di sé e sviluppare\nuna vera e propria affettività verso l’ambiente\nnaturale.', 'A show that encourages children to\nconsider nature as a part of themselves in\norder to make them start loving our natural\nenvironment.', ''),
(7, 'Lupus in Fabula', 45, 1, 3, 5, 1, 0, 'Il Lupo è spesso nelle fiabe tradizionali il\npersonaggio cattivo che aiuta l’eroe a crescere.\nRappresenta una delle prime paure con cui si\nconfronta il bambino, ma in verità i lupi sono\ntanti e tutti diversi e ben lo sanno gli autori\nche hanno scritto per l’infanzia mille e più\nstorie sbizzarrendosi a raccontarne le molte\nsfaccettature. Sara Zoia si cimenta in un\ndivertente racconto a cavallo fra zoologia e\nletteratura per l’infanzia.', 'An amusing story between zoology and\nliterature for children to discover the\ndifferent sides of the wolf.', ''),
(8, 'Let''''s play Kawara', 60, 2, 3, 5, 1, 0, 'Dal Paese del Sol Levante arrivano tre musicisti\ne portano con sé delle tegole artigianali per\nstimolare i più piccoli a sperimentare le sonorità\nprodotte da questi oggetti di terra e fango per\ncomporre una musica mai ascoltata.', 'A workshop to experience the sounds of\nJapanese rootfiles, made of earth and mud,\nand to compose a new kind of music.', ''),
(9, 'A Passeggio con i Pennelli', 45, 2, 3, 7, 0, 0, 'Un’occasione unica per diventare, pennelli alla\nmano, stilisti e designer di un grande classico\ndell’infanzia ormai da oltre 50 anni: la romantica\nculla da passeggio Inglesina. Grandi e piccini\ndipingono en plein air per le vie del centro.', 'Painting atelier of the historical pram by\nInglesina.', ''),
(10, 'Le Città Incantate - suoni e visioni dal Giappone', 45, 1, 3, 10, 1, 0, 'Il Giappone, paese del sol levante, è il luogo in\ncui per primi nascono i colori. Dove le tegole\ne i tetti cantano e le nuvole prendono forme\nche raccontano storie. Dario Moretti ai pennelli\ne i musicisti dell’Awajishima Arts trasportano\ngli spettatori in un mondo di sonorità e di\nimmagini in un inedito concerto improvvisato e\nvisuale in cui delle autentiche tegole giapponesi\ndiventano strumenti musicali.', 'What’s the sound of rooftiles? Two Japanese\nmusicians use them as musical instruments\nduring an improvised visual concert with the\nartist Dario Moretti.', ''),
(11, 'L''''ultimo Lupo', 120, 4, 6, 150, 1, 0, 'Chen Zhen, un giovane studente di Pechino,\nviene inviato nelle zone interne della Mongolia\nper insegnare a una tribù nomade di pastori.\nA contatto con una realtà diversa dalla sua,\nin una terra piena di una bellezza selvaggia e\nvertiginosa, sarà tuttavia il giovane insegnante\nad apprendere qualcosa sugli uomini e sui lupi,\nche il governo ha deciso di sterminare.', 'In a beautiful wild land, the young Chen\nZhen learns an important lesson about\nhuman beings and wolves.', ''),
(12, 'Playcity', 120, 3, 0, 0, 0, 0, 'Il tradizionale appuntamento con la formazione solitamente inserito\nnelle giornate del festival si sposta nelle anticipazioni per permettere\nad operatori ed insegnanti di entrare nel mood del festival ed aver\nmodo di elaborarne gli stimoli. Un laboratorio per insegnanti per\ngiocare con le forme e con le superfici della città, per sperimentare\nmateriali e strumenti, per progettare nuove idee.', 'A workshop for teachers that\naims at playing with the shapes\nand the forms of Mantua and at\n4 creating new ideas.', ''),
(13, 'Little Bang', 60, 1, 4, 10, 1, 0, 'Il tema delle origini della terra e del Big Bang\nraccontato attraverso immagini e metafore in\nmaniera accessibile ai bambini. Uno spettacolo\nche combina scienza e arte contemporanea,\navvicinando il processo della nascita dell’universo\na quello della creatività in sé.', 'What if the Big Bang was like a great work\nof art by Pollock? The mystery of the origin\nof our Planet is explained by a visionary tale\nbetween science and contemporary art..', ''),
(14, 'Tripula', 55, 1, 5, 10, 1, 0, 'Torna a grande richiesta lo spettacolo emozionante sull’avventura dei fratelli Montgolfier che diventa metafora del volo e del potere d’immaginazione dell’uomo che rende possibili importanti progressi. Come in un vero e proprio  viaggio in mongolfiera gli spettatori vengono fatti accomodare in un enorme pallone aerostatico, ne diventano l’equipaggio, e sono attivamente coinvolti in alcune azioni necessarie alla navigazione. Divertimento assicurato che fa della didattica un gioco da ragazzi.', 'An exciting show about Mongolfier brothers’ adventure that becomes a metaphor of flight and human imagination.', ''),
(15, 'In Viaggio per l''''Europa', 120, 3, 14, 18, 0, 1, '  Uno spazio di confronto dedicato agli studenti degli Istituti Superiori per  scoprire strumenti e possibilità che l’Europa offre alle nuove generazioni nell’esplorazioni di settori professionali legati alla cultura e al teatro. Un appuntamento che offre nuove ispirazioni e contenuti per  immaginare  il  proprio futuro grazie allo SVE, Erasmus +, Europa Creativa e dove familiarizzare meglio con obiettivi e contenuti possibili dell’alternanza scuola – lavoro.', 'A space to discuss about the instruments and the opportunities that are offered by  Europe to new generations exploring the professional sectors that are linked to culture and theatre.', ''),
(93, 'MUGIALLO', 33, 1, 18, 24, 0, 1, 'Ohiohiohi, siamo in Italia, oggi si gioca in casa, oggi il bimbominkia marquez è senza gormiti, A-ha-ha-ha-haaaaaa', 'E come dicono in inghilterra:\n\nEverybody stand up on the sofa', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `eventoLuogoData`
--

CREATE TABLE IF NOT EXISTS `eventoLuogoData` (
  `id_istanza` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_luogo` int(11) NOT NULL,
  `data` date NOT NULL,
  `orario` time NOT NULL,
  `orario_esteso` varchar(255) COLLATE utf8_roman_ci NOT NULL COMMENT 'per modellare le fasce orarie (es. lupoteca)',
  `data_ora` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `speciale` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `eventoLuogoData`
--

INSERT INTO `eventoLuogoData` (`id_istanza`, `id_evento`, `id_luogo`, `data`, `orario`, `orario_esteso`, `data_ora`, `speciale`) VALUES
(1, 3, 7, '2016-10-26', '09:30:00', '', '2017-10-26 07:30:00', 0),
(2, 3, 7, '2016-10-26', '17:00:00', '', '2017-10-26 15:00:00', 0),
(3, 3, 7, '2016-10-27', '09:30:00', '', '2017-10-27 07:30:00', 0),
(4, 3, 7, '2016-10-27', '11:00:00', '', '2017-10-27 09:00:00', 0),
(7, 13, 6, '2016-10-26', '10:00:00', '', '2017-10-26 06:50:24', 0),
(8, 13, 15, '2016-10-26', '17:00:00', '', '2017-10-25 22:05:00', 0),
(9, 13, 6, '2016-10-27', '09:30:00', '', '2017-10-27 06:50:24', 0),
(10, 13, 6, '2016-10-27', '17:00:00', '', '2017-10-27 06:50:24', 0),
(11, 13, 6, '2016-10-28', '09:30:00', '', '2017-10-28 06:50:24', 0),
(12, 13, 7, '2016-10-28', '17:00:00', '', '2017-10-27 22:00:00', 0),
(13, 13, 38, '2016-10-29', '10:30:00', '', '2017-10-28 23:05:00', 1),
(14, 13, 27, '2016-10-29', '16:00:00', '', '2017-10-29 12:55:00', 1),
(15, 14, 2, '2016-10-31', '20:30:00', '', '2017-10-31 07:50:24', 1),
(16, 14, 2, '2016-11-01', '11:00:00', '', '2017-11-01 07:50:24', 1),
(17, 14, 2, '2016-11-01', '18:00:00', '', '2017-11-01 07:50:24', 1),
(18, 14, 2, '2016-11-02', '09:00:00', '', '2017-11-02 07:50:24', 0),
(19, 14, 2, '2016-11-02', '11:00:00', '', '2017-11-02 07:50:24', 0),
(20, 15, 22, '2016-10-28', '14:30:00', '', '2017-10-28 06:50:24', 0),
(21, 3, 7, '2017-10-27', '17:00:00', '', '2017-10-27 15:00:00', 0),
(22, 3, 7, '2017-10-28', '09:30:00', '', '2017-10-28 07:30:00', 0),
(29, 5, 11, '2017-09-24', '12:30:00', '', '2017-09-24 10:30:00', 0),
(30, 4, 42, '2017-10-29', '16:30:00', '', '2017-10-29 15:30:00', 0),
(31, 4, 42, '2017-10-29', '18:00:00', '', '2017-10-29 17:00:00', 0),
(32, 4, 42, '2017-10-30', '10:30:00', '', '2017-10-30 09:30:00', 0),
(33, 4, 42, '2017-10-31', '10:30:00', '', '2017-10-31 09:30:00', 0),
(34, 4, 42, '2017-11-01', '10:30:00', '', '2017-11-01 09:30:00', 0),
(35, 4, 42, '2017-11-01', '17:00:00', '', '2017-11-01 16:00:00', 0),
(36, 4, 42, '2017-10-31', '17:00:00', '', '2017-10-31 16:00:00', 0),
(37, 4, 42, '2017-10-30', '17:00:00', '', '2017-10-30 16:00:00', 0),
(38, 1, 22, '2017-09-29', '19:30:00', '', '2017-09-29 17:30:00', 0);

-- --------------------------------------------------------

--
-- Struttura della tabella `eventoPersona`
--

CREATE TABLE IF NOT EXISTS `eventoPersona` (
  `id_istanza` int(11) NOT NULL,
  `id_evento` int(11) NOT NULL,
  `id_persona` int(11) NOT NULL,
  `tipologia` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `eventoPersona`
--

INSERT INTO `eventoPersona` (`id_istanza`, `id_evento`, `id_persona`, `tipologia`) VALUES
(1, 15, 28, 4),
(2, 15, 26, 9),
(3, 15, 27, 9),
(4, 15, 25, 9),
(5, 15, 22, 1),
(6, 15, 23, 1),
(7, 15, 24, 8),
(9, 3, 29, 6),
(11, 3, 31, 5),
(13, 3, 33, 31),
(110, 3, 30, 6),
(111, 3, 43, 30),
(112, 3, 32, 31),
(117, 1, 44, 32),
(118, 1, 45, 32),
(119, 1, 46, 33),
(120, 1, 47, 31),
(121, 1, 48, 34),
(122, 1, 49, 35),
(123, 1, 50, 36),
(124, 4, 53, 37),
(125, 4, 54, 38),
(126, 4, 55, 31),
(127, 4, 56, 31),
(128, 4, 57, 34),
(129, 4, 58, 4);

-- --------------------------------------------------------

--
-- Struttura della tabella `Luogo`
--

CREATE TABLE IF NOT EXISTS `Luogo` (
  `id` int(11) NOT NULL,
  `lettera` varchar(5) CHARACTER SET latin1 NOT NULL COMMENT 'id del volantino evento',
  `colore` enum('orange','green','blue','red') COLLATE utf8_roman_ci NOT NULL,
  `nome` varchar(255) CHARACTER SET latin1 NOT NULL,
  `latitudine` float NOT NULL,
  `longitudine` float NOT NULL,
  `citta` varchar(25) CHARACTER SET latin1 NOT NULL,
  `tipo_via` enum('Via','Piazza','Viale','Corso') CHARACTER SET latin1 NOT NULL DEFAULT 'Via',
  `via` varchar(75) CHARACTER SET latin1 NOT NULL,
  `numero_civico` int(11) NOT NULL,
  `descrizione` text COLLATE utf8_roman_ci,
  `foto` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `Luogo`
--

INSERT INTO `Luogo` (`id`, `lettera`, `colore`, `nome`, `latitudine`, `longitudine`, `citta`, `tipo_via`, `via`, `numero_civico`, `descrizione`, `foto`) VALUES
(1, 'A', 'orange', 'Biblioteca Baratta', 45.1484, 10.7959, 'Mantova', 'Via', 'Giuseppe Garibaldi', 88, 'La Biblioteca è situata in un edificio che era stato dal 1300 al 1786 la sede dell’Ospizio di Sant''Antonio.\n\nNel 1872, fu trasformato in macello comunale, su progetto dell''architetto bresciano Giovanni Cherubini.\n\nDal 1980 al 1990 circa l'' ex macello è stato ristrutturato su progetto dell''architetto Adolfo Poltronieri.\n\nOggi il corpo principale dell''ex macello è sede del Centro culturale Gino Baratta che comprende la biblioteca comunale, l''Archivio Storico Comunale e l''Istituto Mantovano di Storia Contemporanea.', '../..//App/img/luogo/image.jpg'),
(2, 'B', 'orange', 'Centro Culturale Contardo Ferrini', 45.1521, 10.7919, 'Mantova', 'Via', 'Giulio Romano', 15, '\n\nL''ex Collegio Redentore di via Giulio Romano, ora Centro culturale Contardo Ferrini, è stato edificato dove un tempo sorgeva il monastero di Santa Caterina da Siena per munificenza delle sorelle Agnelli: Ippolita vedova Arrivabene e Lionora vedova Andreasi, che qui si dedicarono alla vita religiosa.\n\nIl monastero fu di clausura e il documento più antico che si riferisce alle monache domenicane di S. Caterina si riferisce al 1619. Dell''antico monastero, soppresso nel 1798, rimangono come ricordo le colonne del portico proveniente dal Chiostro della demolita chiesa di S. Domenico.\n\nIl palazzo, recentemente ristrutturato, è destinato ad attività scolastiche. Nell''edificio trovano spazio, oltre alle aule per il normale svolgimento delle attività didattiche, anche aule con strutture e servizi per informatica, disegno, musica e aule multimediali.\n\nIl Centro culturale è intitolato a Contardo Ferrini, figura di spicco della cultura cristiana. Entrò giovanissimo nel Terz''Ordine Francescano e fu caposcuola di una nuova generazione di romanisti in Italia, avendo attenzione particolare all''edizione delle fonti. Fu autore di numerosi scritti di carattere religioso. È stato proclamato beato dal Pontefice Pio XII nel 1947.\n', '../..//App/img/luogo/14.jpeg'),
(3, 'C', 'orange', 'FOR.MA', 45.1517, 10.795, 'Mantova', 'Via', 'Lorenzo Gandolfo', 13, 'PROFILO PROFESSIONALE\nL’Operatore Socio Sanitario è un operatore di interesse sanitario che svolge attività indirizzate a soddisfare i bisogni primari della persona e a favorire il benessere e l’autonomia. L’attività si svolge nel settore sociale e sanitario in servizi di tipo socio – assistenziale e socio – sanitario, in ambito ospedaliero, residenziale e domiciliare.\nIl percorso formativo, della durata di 400 ore, porterà al conseguimento previo superamento di un esame finale e dell'' attestato di qualifica professionale di Operatore Socio Sanitario (O.S.S.), essendo già in possesso della qualifica di Ausiliario Socio Assistenziale (A.S.A.)\n\nPer scaricare la locandina: pdfvolantino_riqualifica.pdf\n\nORARIO POMERIDIANO\nLunedì, Martedì, Mercoledì e Giovedì 14.00 - 18.00\nDurata: 400 ore\nInizio: aprile 2017\nQuota di partecipazione: € 800,00 (rateizzabili)\n\nPer info:\nTel. 0376.638547 (For.Ma Castiglione)\nE mail: iscrizione.corsi@formazionemantova.it\nTel. 0376-432532 (Dott.ssa Pieretti - For.Ma Mantova)', '../..//App/img/luogo/sedemantova.jpg'),
(4, 'D', 'orange', 'Hub Socio Educativo', 45.146, 10.7986, 'Mantova', 'Via', 'Leopoldo Camillo Volta', 9, 'hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova hub socio educativo mantova', '../..//App/img/luogo/teatro-del-piccione.jpg'),
(5, 'E', 'orange', 'Palazzo Ducale, Aula Didattica', 45.1599, 10.7969, 'Mantova', 'Piazza', 'Sordello', 40, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/iStock_000038732498_Small.jpg'),
(6, 'F', 'orange', 'Palazzo Ducale, Atrio degli Arcieri', 45.1598, 10.7982, 'Mantova', 'Piazza', 'Pallone', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/Mantova_Palazzo_Ducale.jpg'),
(7, 'G', 'orange', 'Palazzo Ducale, Rustica', 45.1601, 10.7991, 'Mantova', 'Piazza', 'Santa Barbara', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/632fa65e9ef6d71ab722ecaf9891fb94.jpg'),
(8, 'H', 'orange', 'Palazzo Te, Fruttiere', 45.1469, 10.785, 'Mantova', 'Viale', 'Te', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/1280px-Palazzo_Te_Mantova_4.jpg'),
(9, 'I', 'green', 'Piazza Broletto', 45.1591, 10.7957, 'Mantova', 'Piazza', 'Broletto', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/152204-800x533.jpg'),
(10, 'J', 'green', 'Piazza Concordia', 45.158, 10.7945, 'Mantova', 'Piazza', 'Concordia', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/piazzaconcordia.jpg'),
(11, 'K', 'green', 'Piazza Erbe', 45.1585, 10.7947, 'Mantova', 'Piazza', 'Erbe', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/e9092b0bcc06869b996276ee143f4914.jpg'),
(12, 'L', 'green', 'Piazza Marconi', 45.1583, 10.7931, 'Mantova', 'Piazza', 'Marconi', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/63626764.jpg'),
(13, 'N', 'green', 'Piazza Sordello', 45.1606, 10.795, 'Mantova', 'Piazza', 'Sordello', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/Piazza-sordello-palazzo_ducale_vistaMod4_testata-873.jpg'),
(14, 'O', 'orange', 'Sala Oberdan', 45.1582, 10.7913, 'Mantova', 'Via', 'Oberdan', 11, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/3.jpg'),
(15, 'P', 'orange', 'Salone Mantegnesco, Fondazione Università di Mantova', 45.1605, 10.7874, 'Mantova', 'Via', 'Scarsellini', 2, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/cronistoria-dell-universita-di-mantova.jpg'),
(22, 'V', 'orange', 'Teatro Bibiena', 45.158, 10.7982, 'Mantova', 'Via', 'Accademia', 47, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/photo0jpg.jpg'),
(27, '1', 'blue', 'Gazebo Informativo', 45.1603, 10.7972, 'Mantova', 'Piazza', 'Sordello', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/1_un-gruppo-di-volontari-e-staff-2013.jpg'),
(32, '6', 'red', 'Punto Zero/Biglietteria', 45.159, 10.7956, 'Mantova', 'Piazza', 'Broletto', 5, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/1_un-fgruppo-di-volontari-e-staff-2013.jpg'),
(33, '7', 'blue', 'Stazione FS', 45.1585, 10.7835, 'Mantova', 'Piazza', 'Don Leoni', 0, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL),
(38, 'IZI', 'orange', 'WaWaChicccWaWa2', 15.002, 89.9888, 'Mantova', 'Piazza', 'WAWA', 2, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL),
(42, 'T', 'orange', 'Spazio Studio Sant''Orsola', 45.1579, 10.7862, 'Mantova', 'Via', 'Ivanoe Bonomi', 6, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', '../..//App/img/luogo/1060_f3041901.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `Persona`
--

CREATE TABLE IF NOT EXISTS `Persona` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL,
  `cognome` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL,
  `alt_name` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL COMMENT 'per compagnie o nomi d''arte',
  `titolo` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL,
  `tipologia` int(11) NOT NULL COMMENT 'FK to tipologiaPersona(id)',
  `biografia` text COLLATE utf8_roman_ci,
  `link` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL,
  `foto` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL,
  `foto_mini` varchar(255) COLLATE utf8_roman_ci DEFAULT NULL
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `Persona`
--

INSERT INTO `Persona` (`id`, `nome`, `cognome`, `alt_name`, `titolo`, `tipologia`, `biografia`, `link`, `foto`, `foto_mini`) VALUES
(1, 'Marçelo', 'Maravilla', 'En?gma', 'Filosofo dell''urbe', 1, 'Hey, sonno perenne svegliati\nMi ritrovo sempre un po'' a passeggio sulle Pleiadi\nho sogni lucidi ai confini dell''essere\ne in più il fuoco dentro brucia celere e tossisco cenere\n\nVolevo cedere all''idea\nche Venere l''avessi accanto e non fosse una dea\nla notte qua mi culla tipo una marea\nah, non ti racconto più di lei o sembra un''epopea\n\nFaccio mea culpa, vedo roba assurda\ndentro il viaggio dell''inconscio che mi turba\nl''anima furba mi domanda "cosa vuoi di più"?\ncome amici immaginari sono Freud e Jung\n\nGiù, la coscienza grida "Battiti"!\nla conoscenza molto spesso sfida baratri\nringrazio chi mi duole\nperché è con certe nuvole che riesci ad occhio nudo a fissare il sole\n\nRIT: (x2)\nchiamala follia, oppure fantasia\ncerti pensieri lasceranno la scia\nnon sono lettere ma vibrazioni eteree\neh eh eh, tipo telepatia\n\nANAGOGIA:\nEhi sonno perenne svegliami\nmi ritrovo spesso a spasso sulle pleiadi\ncome in ecstasi\ne per non sentire mentre dici resta qui\nio metto play al beat\n\nCerti pensieri lasciano la scia come il tuo odore\nchiamala follia, oppure dolore\nsoffro ancora di nostalgia\ncerte persone vagano sulla strada dell''utopia senza un navigatore\n\nNon sopporto la vita perché mi fissa\nvorrei la vita un enigma, tu vorresti la vita di En?gma\nho perso gli anni migliori, sprecando tempo a pensare\nse metti pare nei cuori, nascono fiori del male\n\nNon scrivo testi giù di corda per essere un genio\nci vorrebbe molto meno\nla depressione è la droga del nuovo millennio e credo\nche anche questa volta ci andrò sotto pieno\n\nRIT: (x2)\nchiamala follia, oppure fantasia\ncerti pensieri lasceranno la scia\nnon sono lettere ma vibrazioni eteree\neh eh eh, tipo telepatia.    ', NULL, '../..//App/img/artista/engima.jpg', '../..//App/img/artista/mini/engima.jpg'),
(2, NULL, NULL, 'Pixar', NULL, 2, '', NULL, NULL, NULL),
(4, '', '', 'Microsoft', '', 2, '', NULL, NULL, NULL),
(5, NULL, NULL, 'Apple', NULL, 2, '', NULL, NULL, NULL),
(6, 'Paolino', 'Paperino', 'Donald Duck', '', 1, 'Paolino Paperino (Donald Fauntleroy Duck), più noto come Paperino, è un personaggio dei cartoni animati e dei fumetti della Disney. Ha esordito nel cortometraggio La gallinella saggia (The Wise Little Hen) del 1934 e nello stesso anno debutta sui fumetti della serie Sinfonie allegre (Silly Symphonies) e da allora è stato protagonista di molti cortometraggi e di innumerevoli storie a fumetti realizzate oltre che negli Stai Uniti in varie parti del mondo come l''Italia e Brasile. Il successo del personaggio è tale che presto diventa testimonial di molte iniziative in varie parti del mondo e oggetto anche di un diffuso merchandising.\n\nÈ stato definito «l''antieroe per eccellenza, l''incarnazione dell''uomo medio moderno, con le sue frustrazioni, i suoi problemi, le sue nevrosi».', NULL, '../..//App/img/artista/Paperhe_cammina2.jpg', '../..//App/img/artista/mini/Paperhe_cammina2.jpg'),
(9, '', '', 'Machete Crew', 'Prima crew rapcoreasdrubalcore', 3, '', NULL, NULL, NULL),
(10, NULL, NULL, 'Comune di Narnia', NULL, 2, '', NULL, NULL, NULL),
(11, NULL, NULL, 'Compagnia delle Ombre', NULL, 3, '', NULL, NULL, NULL),
(12, NULL, NULL, 'Luci Basse', NULL, 3, '', NULL, NULL, NULL),
(13, NULL, NULL, 'Silvano Belfiore Band', NULL, 3, '', NULL, NULL, NULL),
(15, '', '', 'Universal', '', 2, '', NULL, NULL, NULL),
(16, '', '', 'Warner', '', 2, '', NULL, NULL, NULL),
(19, NULL, NULL, 'Bustaffa', NULL, 4, '', NULL, NULL, NULL),
(20, NULL, NULL, 'Levoni', NULL, 4, '', NULL, NULL, NULL),
(21, 'Matteo', 'Terzi', 'Soltanto', '', 1, ' Sei anni fa, dopo essermi laureato, ho lasciato tutto per girare l''Europa in autostop suonando in strada. Oggi vivo viaggiando con la mia chitarra.', NULL, '../..//App/img/artista/5651001t9.jpg', '../..//App/img/artista/mini/5651001t9.jpg'),
(22, NULL, NULL, 'In search of Europe', NULL, 3, '', NULL, NULL, NULL),
(23, NULL, NULL, 'Meeting Modern Visionaries', NULL, 3, '', NULL, NULL, NULL),
(24, 'Lucas', 'De Man', '', '', 1, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL, '../..//App/img/artista/Lucas-de-man.jpg', '../..//App/img/artista/mini/Lucas-de-man.jpg'),
(25, 'Bruno', 'Marasà', '', 'Direttore presso bla bla', 1, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL, '../..//App/img/artista/maxresdefassstult_1.jpg', '../..//App/img/artista/mini/maxresdefassstult_1.jpg'),
(26, 'Barbara', 'Forni', '', 'Opportunità formative nel blabla', 1, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL, '../..//App/img/artista/brbrela.jpg', '../..//App/img/artista/mini/brbrela.jpg'),
(27, 'Giacomo', 'D''Arrigo', '', 'Direttore generale .''?&.', 1, ' Ieri mattina, su proposta del Ministro per l’Integrazione, Kashetu Cécile Kyenge, il Consiglio dei Ministri ha nominato Giacomo D''Arrigo Direttore generale dell’Agenzia nazionale per i giovani, dopo che dallo scorso luglio la carica era vacante per la fine del mandato del precedente Direttore Paolo Di Caro. D''Arrigo, messinese, 37 anni, vice presidente di Big-Bang Sicilia, fondazione che fa capo all''attuale segretario del Partito Democratico Matteo Renzi, e'' stato consigliere comunale di Nizza di Sicilia (Me) ed e'' autore del libro "L''Italia cambiata dai ragazzini".  ', NULL, '../..//App/img/artista/giacomo_diarrigo.jpg', '../..//App/img/artista/mini/giacomo_diarrigo.jpg'),
(28, NULL, NULL, 'Ufficio d’ informazione a Milano del Parlamento europeo', NULL, 5, '', NULL, NULL, NULL),
(29, NULL, NULL, 'AsLiCo', NULL, 2, '', NULL, NULL, NULL),
(30, NULL, NULL, 'Scarlattineteatro_Campsirago Residenza', NULL, 2, '', NULL, NULL, NULL),
(31, NULL, NULL, 'Opera Baby', NULL, 5, '', NULL, NULL, NULL),
(32, 'Serena', 'Crocco', NULL, NULL, 1, 'Il tuo corpo è come un giardino ma in questo momento stanno crescendo le erbacce. Un dottore anni fa usò questa metafora per diagnosticarmi una malattia. La mia storia nasce così, da una lotta contro le erbacce.\r\nIn un primo momento non capivo, da dove arrivavano? Chi le aveva messe lì? Ma soprattutto.. che cosa volevano?\r\nPer combattere contro un nemico è necessario prima di tutto imparare a conoscerlo. Le erbacce per me erano un nemico da sconfiggere, ma nel tempo della battaglia sono diventate un esempio da seguire. Le erbacce infestano ma allo stesso tempo faticano per trovare il loro posto, per sopravvivere, per resistere. Come le erbacce ho imparato a resistere e ad avere spirito di adattamento.\r\nAffascinata dal corpo e le sue erbacce mi sono laureata in filosofia con una tesi sul corpo in Antonin Artaud e ho deciso di studiare teatro fisico seguendo il metodo Lecoq. Nel frattempo, ho lavorato nel circo sociale, con un''associazione che utilizza il circo come strumento per il recupero dei bambini di strada.  Mi sono recentemente diplomata in teatro fisico e mi sono avvicinato al teatro di figura, frequentando un corso di animazione su nero organizzato dal Teatro del Buratto.  Ora sto sperimentando nel mio lavoro diversi linguaggi: teatro fisico, circo, pupazzi e maschere, di cui sono una grande appassionata.\r\nMi piacerebbe partecipare a questo progetto perché sono particolarmente interessata al tema, che trovo molto affine alla mia esperienza. Sono interessata inoltre al rapporto tra il corpo dell''attore e gli oggetti e conoscendo il lavoro di Duda Paiva questa mi sembra una grande opportunità di studio.', NULL, '../..//App/img/artista/serna.jpg', '../..//App/img/artista/mini/serna.jpg'),
(33, 'Sara', 'Milani', '', '', 1, '\n\nLorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien. ', NULL, '../..//App/img/artista/Mille-Mi-Distante.jpg', '../..//App/img/artista/mini/Mille-Mi-Distante.jpg'),
(34, 'Anna', 'Fascendini', '', '', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/m0c9ANNA_FASCENDINI.jpg', '../..//App/img/artista/mini/m0c9ANNA_FASCENDINI.jpg'),
(36, NULL, NULL, 'Agenzia Nazionale per i Giovani', NULL, 5, '', NULL, NULL, NULL),
(43, '', '', 'Opera Education', '', 5, 'testBio', NULL, NULL, NULL),
(44, '', '', 'Teatro delle albe/Ravenna Teatro', '', 2, '', NULL, NULL, NULL),
(45, '', '', 'Ravenna Festival', '', 2, '', NULL, NULL, NULL),
(46, 'Marco', 'Martinelli', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/Marco-Martinelli.jpg', '../..//App/img/artista/mini/Marco-Martinelli.jpg'),
(47, 'Alessandro', 'Renda', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/_M2A1666_0002.jpg.jpg', '../..//App/img/artista/mini/_M2A1666_0002.jpg.jpg'),
(48, 'Guy', 'Klucevsek', '', '', 1, '   Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/gk.jpg', '../..//App/img/artista/mini/gk.jpg'),
(49, '', '', 'ArtLab16 Mantova', '', 4, '', NULL, NULL, NULL),
(50, '', '', 'AMNESTY INTERNATIONAL', '', 4, '', NULL, NULL, NULL),
(53, '', '', 'Teatro Pan', '', 3, '', NULL, NULL, NULL),
(54, 'Marcello', 'Chiarenza', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/cropFotoChiarenzaMarzo2010.jpg', '../..//App/img/artista/mini/cropFotoChiarenzaMarzo2010.jpg'),
(55, 'Erica', 'Chiaravalli', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/16229261_277510229330059_597761994795253760_n.jpg', '../..//App/img/artista/mini/16229261_277510229330059_597761994795253760_n.jpg'),
(56, 'Karin', 'Hochapfel', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/3561257128_14e42ea87f_z.jpg', '../..//App/img/artista/mini/3561257128_14e42ea87f_z.jpg'),
(57, 'Carlo', 'Cialdo Capelli', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/maxresdefault.jpg', '../..//App/img/artista/mini/maxresdefault.jpg'),
(58, 'Pietro', 'Chiarenza', '', '', 1, ' Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam ac mauris vel ipsum posuere efficitur. Nam metus erat, pharetra sit amet diam a, rhoncus elementum ipsum. Quisque sit amet lorem est. Suspendisse eleifend diam eget mi eleifend vulputate eu sit amet mauris. Mauris rhoncus lobortis mi, tincidunt aliquam ipsum porttitor a. Sed viverra diam non lorem dapibus rhoncus. Integer eu commodo turpis. Ut tellus orci, mollis eget iaculis non, placerat sit amet tortor. Praesent faucibus enim vitae mi varius pellentesque. Phasellus posuere ex at tincidunt luctus. Nam pellentesque laoreet lacinia. Nulla facilisis ultricies purus nec placerat. Cras pulvinar vitae ligula ac placerat. Suspendisse potenti. Cras egestas mattis nulla, sit amet fringilla ex ullamcorper ac. Fusce vel placerat tortor.\n\nAliquam a vestibulum nunc. Nullam luctus velit vel lorem viverra, eu dignissim neque volutpat. Integer quis tristique massa, vel tincidunt ex. In sit amet dolor porta, ullamcorper arcu hendrerit, dignissim justo. Integer vel ultricies urna, in venenatis ipsum. Etiam libero leo, dignissim nec justo in, imperdiet molestie lectus. In hac habitasse platea dictumst.\n\nVestibulum dignissim tellus maximus, ullamcorper justo nec, sagittis arcu. Morbi tempus enim quis libero maximus, a pharetra ipsum tincidunt. Quisque maximus mi ante, at bibendum velit gravida ac. Vivamus in suscipit diam. Nulla suscipit eros eu sem semper rutrum. Praesent tincidunt posuere sapien sed ultricies. Morbi congue porttitor est, ut porta nisl pharetra ut. Praesent ut interdum magna. Pellentesque sagittis elit velit, eu ullamcorper augue condimentum quis. Duis interdum mauris eu sem viverra, eu pulvinar tellus vehicula. Vivamus sollicitudin congue velit, eleifend finibus magna faucibus vel. Nullam eget tortor a libero condimentum commodo ut in ligula. Cras pretium risus et aliquam rhoncus. Maecenas sem metus, venenatis vitae dui ac, efficitur placerat velit. Praesent fermentum eget sem at laoreet. Donec sit amet dolor sapien.  ', NULL, '../..//App/img/artista/2ed27cf.jpg', '../..//App/img/artista/mini/2ed27cf.jpg');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipologiaEvento`
--

CREATE TABLE IF NOT EXISTS `tipologiaEvento` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_roman_ci NOT NULL,
  `descrizione` text COLLATE utf8_roman_ci
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `tipologiaEvento`
--

INSERT INTO `tipologiaEvento` (`id`, `nome`, `descrizione`) VALUES
(1, 'spettacolo', ''),
(2, 'laboratorio', ''),
(3, 'formazione', ''),
(4, 'film', '');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipologiaEventoPersona`
--

CREATE TABLE IF NOT EXISTS `tipologiaEventoPersona` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `tipologiaEventoPersona`
--

INSERT INTO `tipologiaEventoPersona` (`id`, `nome`) VALUES
(37, 'compagnia'),
(31, 'con'),
(36, 'con il patrocinio di'),
(6, 'coproduzione'),
(38, 'di'),
(1, 'in collaborazione con'),
(2, 'musica'),
(34, 'musiche'),
(30, 'Nell''ambito di'),
(9, 'partecipa'),
(32, 'produzione'),
(5, 'progetto'),
(29, 'reggaeEBossanova'),
(4, 'regia'),
(35, 'spettacolo in programma per'),
(33, 'testo e regia'),
(12, 'tipo12'),
(13, 'tipo13'),
(26, 'video'),
(8, 'visual grafici');

-- --------------------------------------------------------

--
-- Struttura della tabella `tipologiaPersona`
--

CREATE TABLE IF NOT EXISTS `tipologiaPersona` (
  `id` int(11) NOT NULL,
  `nome` varchar(255) COLLATE utf8_roman_ci NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_roman_ci;

--
-- Dump dei dati per la tabella `tipologiaPersona`
--

INSERT INTO `tipologiaPersona` (`id`, `nome`) VALUES
(5, 'altro'),
(3, 'compagnia'),
(1, 'persona'),
(2, 'produzione'),
(4, 'sponsor');

--
-- Indici per le tabelle scaricate
--

--
-- Indici per le tabelle `Accesso`
--
ALTER TABLE `Accesso`
  ADD PRIMARY KEY (`id`);

--
-- Indici per le tabelle `Evento`
--
ALTER TABLE `Evento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `tipologiabis` (`tipologia`),
  ADD KEY `id_2` (`id`);

--
-- Indici per le tabelle `eventoLuogoData`
--
ALTER TABLE `eventoLuogoData`
  ADD PRIMARY KEY (`id_istanza`),
  ADD KEY `eventoluogodata_ibfk_1` (`id_evento`),
  ADD KEY `eventoluogodata_ibfk_2` (`id_luogo`);

--
-- Indici per le tabelle `eventoPersona`
--
ALTER TABLE `eventoPersona`
  ADD PRIMARY KEY (`id_istanza`),
  ADD KEY `eventopersona_ibfk_1` (`id_evento`),
  ADD KEY `eventopersona_ibfk_2` (`id_persona`),
  ADD KEY `tipologia` (`tipologia`);

--
-- Indici per le tabelle `Luogo`
--
ALTER TABLE `Luogo`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `lettera` (`lettera`);

--
-- Indici per le tabelle `Persona`
--
ALTER TABLE `Persona`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tipologiabis` (`tipologia`);

--
-- Indici per le tabelle `tipologiaEvento`
--
ALTER TABLE `tipologiaEvento`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `tipologiaEventoPersona`
--
ALTER TABLE `tipologiaEventoPersona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- Indici per le tabelle `tipologiaPersona`
--
ALTER TABLE `tipologiaPersona`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nome` (`nome`);

--
-- AUTO_INCREMENT per le tabelle scaricate
--

--
-- AUTO_INCREMENT per la tabella `Evento`
--
ALTER TABLE `Evento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=94;
--
-- AUTO_INCREMENT per la tabella `eventoLuogoData`
--
ALTER TABLE `eventoLuogoData`
  MODIFY `id_istanza` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT per la tabella `eventoPersona`
--
ALTER TABLE `eventoPersona`
  MODIFY `id_istanza` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=130;
--
-- AUTO_INCREMENT per la tabella `Luogo`
--
ALTER TABLE `Luogo`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=43;
--
-- AUTO_INCREMENT per la tabella `Persona`
--
ALTER TABLE `Persona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=59;
--
-- AUTO_INCREMENT per la tabella `tipologiaEvento`
--
ALTER TABLE `tipologiaEvento`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT per la tabella `tipologiaEventoPersona`
--
ALTER TABLE `tipologiaEventoPersona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT per la tabella `tipologiaPersona`
--
ALTER TABLE `tipologiaPersona`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- Limiti per le tabelle scaricate
--

--
-- Limiti per la tabella `Evento`
--
ALTER TABLE `Evento`
  ADD CONSTRAINT `FKa TipoEvento` FOREIGN KEY (`tipologia`) REFERENCES `tipologiaEvento` (`id`);

--
-- Limiti per la tabella `eventoLuogoData`
--
ALTER TABLE `eventoLuogoData`
  ADD CONSTRAINT `eventoluogodata_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventoluogodata_ibfk_2` FOREIGN KEY (`id_luogo`) REFERENCES `Luogo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Limiti per la tabella `eventoPersona`
--
ALTER TABLE `eventoPersona`
  ADD CONSTRAINT `eventopersona_ibfk_1` FOREIGN KEY (`id_evento`) REFERENCES `Evento` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventopersona_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `Persona` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `eventopersona_ibfk_3` FOREIGN KEY (`tipologia`) REFERENCES `tipologiaEventoPersona` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limiti per la tabella `Persona`
--
ALTER TABLE `Persona`
  ADD CONSTRAINT `FKaTipoPersona` FOREIGN KEY (`tipologia`) REFERENCES `tipologiaPersona` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

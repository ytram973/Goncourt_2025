-- phpMyAdmin SQL Dump
-- version 5.2.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : mar. 09 déc. 2025 à 14:44
-- Version du serveur : 8.4.7
-- Version de PHP : 8.2.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `goncourt`
--

-- --------------------------------------------------------

--
-- Structure de la table `g_author`
--

DROP TABLE IF EXISTS `g_author`;
CREATE TABLE IF NOT EXISTS `g_author` (
  `id_author` int NOT NULL AUTO_INCREMENT,
  `a_first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `a_last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_author`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_author`
--

INSERT INTO `g_author` (`id_author`, `a_first_name`, `a_last_name`) VALUES
(1, 'Nathacha', 'Appanah'),
(2, 'Emmanuel', 'Carrère'),
(3, 'Laurent', 'Mauvignier'),
(4, 'Maria', 'Pourchet'),
(5, 'David', 'Thomas'),
(6, 'Paul', 'Gasnier'),
(7, 'Caroline', 'Lamarche'),
(8, 'David', 'Diop'),
(9, 'David', 'Deneufgermain'),
(10, 'Yanick', 'Lahens'),
(11, 'Charif', 'Majdalani'),
(12, 'Ghislain', 'Dunant'),
(13, 'Hélène', 'Laurain'),
(14, 'Guillaume', 'Poix'),
(15, 'Alfred', 'de Montesquiou');

-- --------------------------------------------------------

--
-- Structure de la table `g_book`
--

DROP TABLE IF EXISTS `g_book`;
CREATE TABLE IF NOT EXISTS `g_book` (
  `id_book` int NOT NULL AUTO_INCREMENT,
  `b_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `b_summary` text COLLATE utf8mb4_unicode_ci,
  `b_publication_date` date DEFAULT NULL,
  `b_page_count` int DEFAULT NULL,
  `b_main_character` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b_isbn` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `b_price` decimal(10,2) DEFAULT NULL,
  `id_author` int NOT NULL,
  `id_publisher` int NOT NULL,
  PRIMARY KEY (`id_book`),
  KEY `fk_book_author` (`id_author`),
  KEY `fk_book_publisher` (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_book`
--

INSERT INTO `g_book` (`id_book`, `b_title`, `b_summary`, `b_publication_date`, `b_page_count`, `b_main_character`, `b_isbn`, `b_price`, `id_author`, `id_publisher`) VALUES
(1, 'La nuit au coeur', 'De ces nuits et de ces vies, de ces femmes qui courent, de ces coeurs qui luttent, de ces instants qui sont si accablants qu\'ils ne rentrent pas dans la mesure du temps, il a fallu faire quelque chose. Il y a l\'impossibilité de la vérité entière à chaque page mais la quête désespérée d\'une justesse au plus près de la vie, de la nuit, du coeur, du corps, de l\'esprit.\r\n\r\nDe ces trois femmes, il a fallu commencer par la première, celle qui vient d\'avoir vingt-cinq ans quand elle court et qui est la seule à être encore en vie aujourd\'hui.\r\n\r\nCette femme, c\'est moi. »\r\n\r\nLa nuit au coeur entrelace trois histoires de femmes victimes de la violence de leur compagnon. Sur le fil entre force et humilité, Nathacha Appanah scrute l\'énigme insupportable du féminicide conjugal, quand la nuit noire prend la place de l\'amour.', '2025-08-15', 282, 'Trois femmes', '9782073080028', 21.00, 1, 1),
(2, 'Kolkhoze', 'Cette nuit-là, rassemblés tous les trois autour de notre mère, nous avons pour la dernière fois fait kolkhoze', '2025-08-28', 558, 'trois autour', '9782818061985', 24.00, 2, 2),
(3, 'La Maison vide', 'En 1976, mon père a rouvert la maison qu’il avait reçue de sa mère, restée fermée pendant vingt ans.\r\n\r\nÀ l’intérieur : un piano, une commode au marbre ébréché, une Légion d’honneur, des photographies sur lesquelles un visage a été découpé aux ciseaux.\r\n\r\nUne maison peuplée de récits, où se croisent deux guerres mondiales, la vie rurale de la première moitié du vingtième siècle, mais aussi Marguerite, ma grand-mère, sa mère Marie-Ernestine, la mère de celle-ci, et tous les hommes qui ont gravité autour d’elles.\r\n\r\nToutes et tous ont marqué la maison et ont été progressivement effacés. J’ai tenté de les ramener à la lumière pour comprendre ce qui a pu être leur histoire, et son ombre portée sur la nôtre.', '2025-08-28', 743, 'un fils ,père, mère ', '9782707356741', 25.00, 3, 3),
(4, 'Tressaillir', 'J\'ai coupé un lien avec quelque chose d\'aussi étouffant que vital et je ne suis désormais plus branchée sur rien. Ni amour, ni foi, ni médecine. »\r\n\r\nUne femme est partie. Elle a quitté la maison, défait sa vie. Elle pensait découvrir une liberté neuve mais elle éprouve, prostrée dans une chambre d\'hôtel, l\'élémentaire supplice de l\'arrachement. Et si rompre n\'était pas à sa portée ? Si la seule issue au chagrin, c\'était revenir ? Car sans un homme à ses côtés, cette femme a peur. Depuis toujours sur le qui-vive, elle a peur.\r\n\r\nMais au fond, de quoi ?\r\n\r\nDans ce texte du retour aux origines et du retour de la joie, Maria Pourchet entreprend une archéologie de ces terreurs d\'enfant qui hantent les adultes. Elle nous transporte au coeur des forêts du Grand Est sur les traces de drames intimes et collectifs.', '2025-08-20', 324, 'Maria Pourchet', '9782234097155', 21.00, 4, 4),
(5, 'Un frère', 'Pendant presque quarante ans, il aura été là sans plus vraiment être là. Lui, mais plus lui. Un autre. »\r\n\r\nDavid Thomas raconte le combat de son frère contre cette tyrannie intérieure qu’est la schizophrénie. Sa dureté, sa noirceur, ses ravages. Depuis la mort brutale d’Édouard jusqu’aux années heureuses, il remonte à la source du lien qu’il a eu avec son aîné et grâce auquel il s’est construit. Lors de ce cheminement, il s’interroge : comment écrire cette histoire sans trahir, sans enjoliver ? Écrire pour rejoindre Édouard. Le retrouver', '2025-08-22', 139, 'David Thomas raconte le combat de son frère ', '9782823623376', 19.00, 5, 5),
(6, 'La collision', 'La collision\r\n\r\nEn 2012, en plein centre-ville de Lyon, une femme décède brutalement, percutée par un jeune garçon en moto cross qui fait du rodéo urbain à 80 km/h.\r\n\r\nDix ans plus tard, son fils, qui n\'a cessé d\'être hanté par le drame, est devenu journaliste. Il observe la façon dont ce genre de catastrophe est utilisé quotidiennement pour fracturer la société et dresser une partie de l\'opinion contre l\'autre. Il décide de se replonger dans la complexité de cet accident, et de se lancer sur les traces du motard pour comprendre d\'où il vient, quel a été son parcours et comment un tel événement a été rendu possible.\r\n\r\nEn décortiquant ce drame familial, Paul Gasnier révèle deux destins qui s\'écrivent en parallèle, dans la même ville, et qui s\'ignorent jusqu\'au jour où ils entrent violemment en collision. C\'est aussi l\'histoire de deux familles qui racontent chacune l\'évolution du pays. Un récit en forme d\'enquête littéraire qui explore la force de nos convictions quand le réel les met à mal, et les manquements collectifs qui créent l\'irrémédiable.', '2025-08-21', 160, 'journaliste', '9782073101228', 19.00, 6, 1),
(7, 'Le bel obscur', 'Alors qu’elle tente d’élucider le destin d’un ancêtre banni par sa famille, une femme reprend l’histoire de sa propre vie. Des années auparavant, son mari, son premier et grand amour, lui a révélé être homosexuel. Du bouleversement que ce fut dans leur existence comme des péripéties de leur émancipation respective, rien n’est tu. Ce roman lumineux nous offre une leçon de courage, de tolérance, de curiosité aussi. Car jamais cette femme libre n’aura cessé de se réinventer, d’affirmer la puissance de ses rêves contre les conventions sociales, avec une fantaisie et une délicatesse infinies.\r\n\r\nCaroline Lamarche vit à Liège. Son œuvre témoigne d’un éclectisme et d’une hardiesse renouvelés de livre en livre. Elle a notamment obtenu le prix Rossel avec Le Jour du Chien (Les Éditions de Minuit) et le Goncourt de la nouvelle pour Nous sommes à la lisière (Gallimard). Elle signe avec Le Bel Obscur son retour au roman.', '2025-08-22', 229, 'une femme', '9782021603439', 20.00, 7, 6),
(8, 'Où s\'adosse le ciel', 'À la fin du XIXe siècle, Bilal Seck achève un pèlerinage à La Mecque et s\'apprête à rentrer à Saint-Louis du Sénégal. Une épidémie de choléra décime alors la région, mais Bilal en réchappe, sous le regard incrédule d\'un médecin français qui cherche à percer les secrets de son immunité. En pure perte. Déjà, Bilal est ailleurs, porté par une autre histoire, celle qu\'il ne cesse de psalmodier, un mythe immense, demeuré intact en lui, transmis par la grande chaîne de la parole qui le relie à ses ancêtres. Une odyssée qui fut celle du peuple égyptien, alors sous le joug des Ptolémées, conduite par Ounifer, grand prêtre d\'Osiris qui caressait le rêve de rendre leur liberté aux siens, les menant vers l\'ouest à travers les déserts, jusqu\'à une terre promise, un bel horizon, là où s\'adosse le ciel...\r\nCe chemin, Bilal l\'emprunte à son tour, vers son pays natal, en passant par Djenné, la cité rouge, où vint buter un temps le voyage d\'Ounifer et de son peuple.\r\n\r\nDe l\'Égypte ancienne au Sénégal, David Diop signe un roman magistral sur un homme parti à la reconquête de ses origines et des sources immémoriales de sa parole.', '2025-08-14', 363, 'Bilal Seck', '9782260057307', 22.00, 8, 7),
(9, 'L\' Adieu au visage', 'Un roman en apnée sur la pandémie. Ce qu\'elle a fait aux vivants et aux morts, à notre humanité.\r\n\r\nMars 2020. La France se confine. Dans tous les hôpitaux du pays, il faut prendre des décisions et agir vite. En première ligne, un psychiatre partage son temps entre son équipe mobile qui maraude dans une ville fantôme à la recherche de marginaux à protéger, et les unités covid où les malades meurent seuls, privés de tout rite. Entre obéissance à la loi et refus de l\'horreur, que ce soit à l\'hôpital ou dehors, chacun à son niveau cherche des solutions et improvise. L\'Adieu au visage est l\'écriture d\'une résistance fragile et d\'une lutte pour prendre soin de l\'autre.\r\n\r\n« Au commencement, on ne lave plus les corps, on ne les coiffe plus, on ne les habille plus, on ne les présente plus - d\'accompagner les morts, il n\'est plus question.', '2025-08-20', 261, 'un psychiatre', '9782381340647', 21.00, 9, 8),
(10, 'Passagères de nuit', 'Dans ce nouveau roman, comme arraché au chaos de son quotidien à Port-au-Prince, Yanick Lahens rend un hommage d’espoir et de résistance à la lignée des femmes dont elle est issue.\r\nLa première d’entre elles, Élizabeth Dubreuil, naît vers 1820 à La Nouvelle-Orléans. Sa grand-mère, arrivée d’Haïti au début du siècle dans le sillage du maître de la plantation qui avait fini par l’affranchir, n’a plus jamais voulu dépendre d’un homme. Inspirée par ce puissant exemple, la jeune Élisabeth se rebelle à son tour contre le désir prédateur d’un ami de son père. Elle doit fuir la ville, devenant à son tour une « passagère de nuit » sur un bateau à destination de Port-au-Prince. Ce qui adviendra d’elle, nous l’apprendrons quand son existence croisera celle de Régina, autre grande figure de ce roman des origines.\r\nNée pauvre parmi les pauvres dans un hameau du sud de l’île d’Haïti, Régina elle aussi a forcé le destin : rien ne la déterminait à devenir la maîtresse d’un des généraux arrivé en libérateur à Port-au-Prince en 1867. C’est à « mon général, mon amant, mon homme » qu’elle adresse le monologue amoureux dans lequel elle évoque sa trajectoire d’émancipation : la cruauté mesquine des maîtres qu’elle a fuis trouve son contrepoint dans les mains tendues par ces femmes qui lui ont appris à opposer aux coups du sort une ténacité silencieuse.\r\nCette ténacité silencieuse, Élizabeth et Régina l’ont reçue en partage de leurs lointaines ascendantes, ces « passagères de nuit » des bateaux négriers, dont Yanick Lahens évoque ici l’effroyable réalité, de même qu’elle nous plonge – et ce n’est pas la moindre qualité de ce très grand livre – dans les convulsions de l’histoire haïtienne.\r\nLorsque les deux héroïnes se rencontreront, dans une scène d’une rare qualité d’émotion, nous, lectrices et lecteurs, comprendrons que l’histoire ne s’écrit pas seulement avec les vainqueurs, mais dans la beauté des gestes, des regards et des mystères tus, qui à bas bruit montrent le chemin d’une résistance forçant l’admiration.', '2025-08-28', 223, 'Élizabeth Dubreuil\nRegina', '9782848055701', 20.00, 10, 9),
(11, 'Le nom des rois', 'Et d\'un seul coup, le monde qui servait de décor à tout cela s\'écroula. J\'en avais été un témoin distrait, mais le bruit qu\'il provoqua en s\'effondrant me fit lever la tête et ce que je vis alors n\'était plus qu\'un univers de violence et de mort. C\'est de celui-là que je suis devenu contemporain. J\'avais été, durant des années, dispensé d\'intérêt pour ce qui se passait autour de moi par ma passion des atlas, par les royautés anciennes et inutiles et par les terres lointaines et isolées, les berceaux de vieux empires oubliés.\r\n\r\nDésormais, l\'histoire se faisait sous mes yeux et je la trouvais moche, roturière et vulgaire. »\r\n\r\nDans ce récit de passage à l\'âge adulte porté par une écriture ample et élégante, Charif Majdalani raconte la disparition d\'un pays et explore ce qui subsiste de l\'enfance lorsqu\'elle capitule devant les fracas du monde.', '2025-08-20', 214, 'Charif Majdalani', '9782234097278', 20.00, 11, 4),
(12, 'Un amour infini', 'Ce roman installe le lecteur au coeur d\'une rencontre de trois jours sur l\'île de Ténérife, en juin 1964, prévue mais bouleversée par un événement tragique, entre un astrophysicien d\'origine hongroise qui a dû fuir l\'Europe et s\'exiler aux États-Unis et une mère de famille française.\r\n\r\nAlors que rien ne devrait les rapprocher, leurs conversations sur leurs passés distincts et l\'exploration de l\'île vont les ouvrir profondément l\'un à l\'autre. Le ciel, l\'univers, l\'histoire de la Terre... Les sujets de l\'astrophysicien rejoignent la sensibilité de celle qui a observé le mystère de la toute petite enfance et a toujours eu une approche sensitive des êtres. Leur désir réciproque va s\'accompagner de la puissance des éléments qui les entourent.\r\n\r\n1964. Sur l\'île de Tenerife. Une femme et un homme que rien ne destinait à se rencontrer, et, pourtant, durant 3 jours, en cette géographie volcanique et insulaire, naîtra l\'une des plus belles rencontres amoureuses écrites ces dernières années...Roman sensible subtile et sensuel, où le paysage cosmique, absolu de l\'île de Tenerife et la rencontre entre Louise et Nathan confluent si intimement que l\'impression laissée par cette histoire à l\'écriture aussi délicate que tellurique perdure infiniment.', '2025-08-20', 170, 'Une femme et un homme ', '9782226498687', 19.00, 12, 10),
(13, 'Tambora', 'Une mère nous parle de ses deux filles, qu’elle voit amples comme des villes en expansion. La première est déjà là quand le récit commence, la seconde naîtra bientôt, après la perte d’un autre enfant lors d’une fausse couche. Ici, la temporalité de la maternité domine : celle de grossesses compliquées, d’hôpitaux et de services des urgences, la temporalité d’un corps qui produit, parfois sans qu’on le veuille, la temporalité de la naissance, celle des soins, ou des désirs trop souvent empêchés. Mais d’autres réalités existent aussi, se faufilent et tentent de prendre leur place : un manuscrit qui intéresse un éditeur, des confinements, qui ne changent pas grand-chose lorsqu’on doit rester alitée, la catastrophe environnementale qui se déploie, gigantesque, et fait songer à la fin du monde que l’humanité a cru vivre en 1815 quand l’éruption du volcan Tambora plongea une partie de la Terre dans le froid et l’obscurité. Hélène Laurain écrit avec cela, et écrit tout cela, avec crudité parfois. Son livre conjugue récit, réflexions et poésie, et nous emmène à la rencontre d’un monde incertain.', '2025-08-28', 192, 'une mère', '9782378562588', 18.00, 13, 11),
(14, 'Perpétuité', 'perpétuité\r\n\r\n18h45. Une maison d\'arrêt du sud de la France. Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit. Captifs d\'une routine qui menace à chaque instant de déraper, ces agents de la pénitentiaire vont traverser ensemble une série d\'incidents plus éprouvants qu\'à l\'ordinaire.\r\n\r\nEn regardant celles et ceux qui regardent, Guillaume Poix plonge dans le quotidien d\'un métier méconnu, sinon méprisé, et interroge le sens d\'une institution au bord du gouffre.', '2025-08-21', 331, 'Pierre, Houda, Laurent, Maëva et d\'autres surveillants prennent leur service de nuit.', '9782073105455', 22.00, 14, 12),
(15, 'Le crépuscule des hommes', 'Nuremberg, 1945 : un procès fait l\'Histoire, eux la vivent. Un roman vrai, qui saisit les sursauts de l\'Histoire en marche.\r\nChacun connaît les images du procès de Nuremberg, où Göring et vingt autres nazis sont jugés à partir de novembre 1945. Mais que se passe-t-il hors de la salle d\'audience ?\r\nIls sont là : Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos, venus assister à ces dix mois où doit oeuvrer la justice. Des dortoirs de l\'étrange château Faber-Castell, qui loge la presse internationale, aux box des accusés, tous partagent la frénésie des reportages, les frictions entre alliés occidentaux et soviétiques, l\'effroi que suscite le récit inédit des déportés.\r\nAvec autant de précision historique que de tension romanesque, Alfred de Montesquiou ressuscite des hommes et des femmes de l\'ombre, témoins du procès le plus retentissant du XXe siècle.', '2025-08-28', 382, 'Joseph Kessel, Elsa Triolet, Martha Gellhorn ou encore John Dos Passos', '9782221267660', 22.00, 15, 13);

-- --------------------------------------------------------

--
-- Structure de la table `g_book_selection`
--

DROP TABLE IF EXISTS `g_book_selection`;
CREATE TABLE IF NOT EXISTS `g_book_selection` (
  `id_book` int NOT NULL,
  `id_selection` int NOT NULL,
  PRIMARY KEY (`id_book`,`id_selection`),
  KEY `fk_book_selection_selection` (`id_selection`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_book_selection`
--

INSERT INTO `g_book_selection` (`id_book`, `id_selection`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1);

-- --------------------------------------------------------

--
-- Structure de la table `g_jury_member`
--

DROP TABLE IF EXISTS `g_jury_member`;
CREATE TABLE IF NOT EXISTS `g_jury_member` (
  `id_jury_member` int NOT NULL AUTO_INCREMENT,
  `j_first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_login` varchar(80) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_password_hash` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `j_is_president` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_jury_member`),
  UNIQUE KEY `j_login` (`j_login`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_jury_member`
--

INSERT INTO `g_jury_member` (`id_jury_member`, `j_first_name`, `j_last_name`, `j_login`, `j_password_hash`, `j_is_president`) VALUES
(1, 'Pascal', 'Bruckner', 'a', '', 0),
(2, 'Eric-Emmanuel', 'Schmitt', 'b', '', 0),
(3, 'Didier', 'Decoin', 'c', '', 0),
(4, 'Paule', 'Constant', 'd', '', 0),
(5, 'Christine', 'Angot', 'e', '', 0),
(6, 'Tahar Ben', 'Jelloun', 'f', '', 0),
(7, 'Camille', 'Laurens', 'g', '', 0),
(8, 'Françoise', 'Chandernagor', 'h', '', 0),
(9, 'Philippe', 'Claudel', 'i', '', 1),
(10, 'Pierre', 'Assouline', 'j', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `g_publisher`
--

DROP TABLE IF EXISTS `g_publisher`;
CREATE TABLE IF NOT EXISTS `g_publisher` (
  `id_publisher` int NOT NULL AUTO_INCREMENT,
  `p_name` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_publisher`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_publisher`
--

INSERT INTO `g_publisher` (`id_publisher`, `p_name`) VALUES
(1, 'Gallimard'),
(2, 'POL'),
(3, 'Minuit'),
(4, 'Stock'),
(5, 'Ed. de l\'Olivier'),
(6, 'Seuil'),
(7, 'Julliard'),
(8, 'Editions Marchialy'),
(9, 'Sabine Wespieser éditeur'),
(10, 'Albin Michel'),
(11, 'Verdier'),
(12, 'Verticales'),
(13, 'R. Laffont');

-- --------------------------------------------------------

--
-- Structure de la table `g_selection`
--

DROP TABLE IF EXISTS `g_selection`;
CREATE TABLE IF NOT EXISTS `g_selection` (
  `id_selection` int NOT NULL AUTO_INCREMENT,
  `s_year` int NOT NULL,
  `s_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `s_selection_date` date DEFAULT NULL,
  PRIMARY KEY (`id_selection`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `g_selection`
--

INSERT INTO `g_selection` (`id_selection`, `s_year`, `s_type`, `s_selection_date`) VALUES
(1, 2025, 'FIRST', '2025-09-03'),
(2, 2025, 'SECOND', '2025-10-07'),
(3, 2025, 'THIRD', '2025-10-28');

-- --------------------------------------------------------

--
-- Structure de la table `g_vote_result`
--

DROP TABLE IF EXISTS `g_vote_result`;
CREATE TABLE IF NOT EXISTS `g_vote_result` (
  `id_vote_result` int NOT NULL AUTO_INCREMENT,
  `v_votes_count` int NOT NULL,
  `id_book` int NOT NULL,
  PRIMARY KEY (`id_vote_result`),
  UNIQUE KEY `uq_vote_result_book` (`id_book`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `g_book`
--
ALTER TABLE `g_book`
  ADD CONSTRAINT `fk_book_author` FOREIGN KEY (`id_author`) REFERENCES `g_author` (`id_author`),
  ADD CONSTRAINT `fk_book_publisher` FOREIGN KEY (`id_publisher`) REFERENCES `g_publisher` (`id_publisher`);

--
-- Contraintes pour la table `g_book_selection`
--
ALTER TABLE `g_book_selection`
  ADD CONSTRAINT `fk_book_selection_book` FOREIGN KEY (`id_book`) REFERENCES `g_book` (`id_book`),
  ADD CONSTRAINT `fk_book_selection_selection` FOREIGN KEY (`id_selection`) REFERENCES `g_selection` (`id_selection`);

--
-- Contraintes pour la table `g_vote_result`
--
ALTER TABLE `g_vote_result`
  ADD CONSTRAINT `fk_vote_result_book` FOREIGN KEY (`id_book`) REFERENCES `g_book` (`id_book`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

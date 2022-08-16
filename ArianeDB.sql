-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 29 juil. 2022 à 12:59
-- Version du serveur : 5.7.34
-- Version de PHP : 7.4.21

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `ArianeDB`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `id` int(6) NOT NULL,
  `name` varchar(500) NOT NULL,
  `flux_type_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `activite`
--

INSERT INTO `activite` (`id`, `name`, `flux_type_id`) VALUES
(1, 'Préparation courrier', 1),
(2, 'Numérisation', 1),
(3, 'Extractions', 1),
(4, 'Typage', 2),
(5, 'Codage', 2),
(6, 'IDP', 2);

-- --------------------------------------------------------

--
-- Structure de la table `anomalie`
--

CREATE TABLE `anomalie` (
  `id` int(6) NOT NULL,
  `date_anomalie` date NOT NULL,
  `description` varchar(5000) NOT NULL,
  `lot` varchar(500) NOT NULL,
  `image_id` int(6) DEFAULT NULL,
  `anomalie_historique` int(6) DEFAULT NULL,
  `anomalie_type_id` int(6) NOT NULL,
  `anomalie_statue_id` int(6) NOT NULL,
  `operateur_id` int(6) DEFAULT NULL,
  `est_courant` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anomalie`
--

INSERT INTO `anomalie` (`id`, `date_anomalie`, `description`, `lot`, `image_id`, `anomalie_historique`, `anomalie_type_id`, `anomalie_statue_id`, `operateur_id`, `est_courant`) VALUES
(3, '2022-07-13', 'ZZ', 'ZZZ', 2, 1, 34, 1, 1, 1),
(4, '2022-08-06', 'tst', 'sst', 2, 1, 22, 3, 1, 1);

-- --------------------------------------------------------

--
-- Structure de la table `anomalie_historique`
--

CREATE TABLE `anomalie_historique` (
  `id` int(6) NOT NULL,
  `date_historique` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anomalie_historique`
--

INSERT INTO `anomalie_historique` (`id`, `date_historique`) VALUES
(1, '2022-07-28');

-- --------------------------------------------------------

--
-- Structure de la table `anomalie_statut`
--

CREATE TABLE `anomalie_statut` (
  `id` int(6) NOT NULL,
  `statut` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anomalie_statut`
--

INSERT INTO `anomalie_statut` (`id`, `statut`) VALUES
(1, 'valide'),
(2, 'annule'),
(3, 'en attente');

-- --------------------------------------------------------

--
-- Structure de la table `anomalie_type`
--

CREATE TABLE `anomalie_type` (
  `id` int(6) NOT NULL,
  `ano_type_nom` varchar(500) NOT NULL,
  `ecart_nom` varchar(500) NOT NULL,
  `point` int(100) NOT NULL,
  `activite` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `anomalie_type`
--

INSERT INTO `anomalie_type` (`id`, `ano_type_nom`, `ecart_nom`, `point`, `activite`) VALUES
(1, 'Non-conformité Client ', 'NCC', 50, 1),
(2, 'Paiement', 'PT', 50, 1),
(3, 'Fausse direction', 'FD', 25, 1),
(4, 'Erreur séparateur de lot ', 'ERR SEP LOT', 25, 1),
(5, 'Non concerné ', 'NC', 25, 1),
(6, 'Erreur Cronos ', 'ERR CRONOS', 25, 1),
(7, 'Erreur agrafe', 'ERR AG', 10, 1),
(8, 'Erreur prépa ', 'ERR PREP', 5, 1),
(9, 'Non-conformité Client ', 'NCC', 50, 2),
(10, 'Paiement', 'PT', 50, 2),
(15, 'Erreur de workflow ', 'ERR WKF', 25, 2),
(16, 'Erreur de date AR', 'ERR DATE', 25, 2),
(17, 'Double prise', 'DP', 10, 2),
(18, 'Erreur numérisation', 'ERR NUM ', 10, 2),
(19, 'Non-conformité Client ', 'NCC', 50, 3),
(20, 'Pli déjà extrait avec mauvais sommaire ', 'ERR EXT', 50, 3),
(21, 'Anomalies client déclarées via Mantis ', 'Err Mantis ', 50, 4),
(22, 'Anomalies Client déclarées via Mail ', 'Err Mail', 50, 4),
(23, 'Répétition d’erreur dans un même lot niveau 1 ', 'Err Répétition Niv1', 5, 4),
(24, 'Répétition d’erreur dans un même lot niveau 2', 'Err Répétition Niv2', 10, 4),
(25, 'Répétition d’erreur dans un même lot niveau 3', 'Err Répétition Niv3', 25, 4),
(26, 'Erreur TYPAGE paiement ', 'Err Typage ', 25, 4),
(27, 'Erreur paiement non vu ', 'Err PT NV ', 25, 4),
(28, 'Erreur Exception', 'Err Exception', 10, 4),
(29, 'Erreur saisie', ' Err Saisie', 5, 4),
(30, 'Erreur paiement non vu ', 'Err PT NV ', 25, 5),
(31, 'Erreur Exception 10', 'Err Exception', 10, 5),
(32, 'Erreur saisie', ' Err Saisie', 5, 5),
(33, 'Anomalies client déclarées via Mantis', 'Err Mantis', 50, 5),
(34, 'Anomalies Client déclarées via Mail ', 'Err Mail', 50, 5),
(35, 'Répétition d’erreur dans un même lot niveau 1 ', 'Err Répétition Niv1', 5, 5),
(36, 'Répétition d’erreur dans un même lot niveau 2', 'Err Répétition Niv2', 10, 5),
(37, 'Répétition d’erreur dans un même lot niveau 3', 'Err Répétition Niv3', 25, 5),
(38, 'Erreur caractères illisibles et/ou vide ', 'Err Caractères', 5, 5),
(39, 'Anomalies client déclarées via Mantis', 'Err Mantis', 50, 6),
(40, 'Anomalies Client déclarées via Mail ', 'Err Mail', 50, 6),
(41, 'Répétition d’erreur dans un même lot niveau 1 ', 'Err Répétition Niv1', 5, 6),
(42, 'Répétition d’erreur dans un même lot niveau 2', 'Err Répétition Niv2', 10, 6),
(43, 'Répétition d’erreur dans un même lot niveau 3', 'Err Répétition Niv3', 25, 6),
(44, 'Erreur de détourage niveau 1 ', 'Err Détourage Niv1 ', 5, 6),
(45, 'Erreur de détourage niveau 3 ', 'Err Détourage Niv3 ', 25, 6),
(46, 'Erreur de rejet ', 'Err Rejet ', 10, 6);

-- --------------------------------------------------------

--
-- Structure de la table `employe`
--

CREATE TABLE `employe` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `prenom` varchar(500) NOT NULL,
  `role_id` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `employe`
--

INSERT INTO `employe` (`id`, `nom`, `prenom`, `role_id`) VALUES
(1, 'Mouloue', 'Marouane', 1),
(2, 'Mouloue', 'amine', 2);

-- --------------------------------------------------------

--
-- Structure de la table `flux_type`
--

CREATE TABLE `flux_type` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `flux_type`
--

INSERT INTO `flux_type` (`id`, `nom`) VALUES
(1, 'Physique'),
(2, 'Numérique');

-- --------------------------------------------------------

--
-- Structure de la table `hibernate_sequence`
--

CREATE TABLE `hibernate_sequence` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `hibernate_sequence`
--

INSERT INTO `hibernate_sequence` (`next_val`) VALUES
(1);

-- --------------------------------------------------------

--
-- Structure de la table `image`
--

CREATE TABLE `image` (
  `id` int(6) NOT NULL,
  `path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `image`
--

INSERT INTO `image` (`id`, `path`) VALUES
(2, '/Assets/img/1.png');

-- --------------------------------------------------------

--
-- Structure de la table `role`
--

CREATE TABLE `role` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `role`
--

INSERT INTO `role` (`id`, `nom`) VALUES
(1, 'operateur'),
(2, 'chef d equipe');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flux_type_id` (`flux_type_id`) USING BTREE;

--
-- Index pour la table `anomalie`
--
ALTER TABLE `anomalie`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_anomalie_employe` (`operateur_id`),
  ADD KEY `fk_anomalie_historique` (`anomalie_historique`),
  ADD KEY `fk_anomalie_statue` (`anomalie_statue_id`),
  ADD KEY `fk_anomalie_type` (`anomalie_type_id`),
  ADD KEY `fk_anomalie_image` (`image_id`);

--
-- Index pour la table `anomalie_historique`
--
ALTER TABLE `anomalie_historique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `anomalie_statut`
--
ALTER TABLE `anomalie_statut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `anomalie_type`
--
ALTER TABLE `anomalie_type`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activite` (`activite`) USING BTREE;

--
-- Index pour la table `employe`
--
ALTER TABLE `employe`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role_operateur` (`role_id`);

--
-- Index pour la table `flux_type`
--
ALTER TABLE `flux_type`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `image`
--
ALTER TABLE `image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `anomalie`
--
ALTER TABLE `anomalie`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `anomalie_historique`
--
ALTER TABLE `anomalie_historique`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `anomalie_statut`
--
ALTER TABLE `anomalie_statut`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `anomalie_type`
--
ALTER TABLE `anomalie_type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `employe`
--
ALTER TABLE `employe`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `flux_type`
--
ALTER TABLE `flux_type`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `image`
--
ALTER TABLE `image`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `activite`
--
ALTER TABLE `activite`
  ADD CONSTRAINT `FK1knq1lrs2f1fhqq1345qrecp6` FOREIGN KEY (`flux_type_id`) REFERENCES `flux_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `anomalie`
--
ALTER TABLE `anomalie`
  ADD CONSTRAINT `fk_anomalie_employe` FOREIGN KEY (`operateur_id`) REFERENCES `employe` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anomalie_historique` FOREIGN KEY (`anomalie_historique`) REFERENCES `anomalie_historique` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anomalie_image` FOREIGN KEY (`image_id`) REFERENCES `image` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anomalie_statue` FOREIGN KEY (`anomalie_statue_id`) REFERENCES `anomalie_statut` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_anomalie_type` FOREIGN KEY (`anomalie_type_id`) REFERENCES `anomalie_type` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `anomalie_type`
--
ALTER TABLE `anomalie_type`
  ADD CONSTRAINT `fk_activite` FOREIGN KEY (`activite`) REFERENCES `activite` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `employe`
--
ALTER TABLE `employe`
  ADD CONSTRAINT `fk_role_operateur` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

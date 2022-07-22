-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le : ven. 22 juil. 2022 à 15:53
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
-- Structure de la table `Activité`
--

CREATE TABLE `Activité` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `fluxTypeId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Activité`
--

INSERT INTO `Activité` (`id`, `nom`, `fluxTypeId`) VALUES
(1, 'Préparation courrier', 1),
(2, 'Numérisation', 1),
(3, 'Extractions', 1),
(4, 'Typage', 2),
(5, 'Codage', 2),
(6, 'IDP', 2);

-- --------------------------------------------------------

--
-- Structure de la table `ANOMALIE`
--

CREATE TABLE `ANOMALIE` (
  `id` int(6) NOT NULL,
  `dateAnomalie` date NOT NULL,
  `point` int(100) NOT NULL,
  `description` varchar(5000) NOT NULL,
  `lot` varchar(500) NOT NULL,
  `estCourant` tinyint(1) NOT NULL,
  `imageId` int(6) NOT NULL,
  `anomalieHistorique` int(6) NOT NULL,
  `anomalieTypeId` int(6) NOT NULL,
  `anomalieStatueId` int(6) NOT NULL,
  `operateurId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `AnomalieHistorique`
--

CREATE TABLE `AnomalieHistorique` (
  `id` int(6) NOT NULL,
  `dateHistorique` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `AnomalieStatut`
--

CREATE TABLE `AnomalieStatut` (
  `id` int(6) NOT NULL,
  `statut` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `AnomalieStatut`
--

INSERT INTO `AnomalieStatut` (`id`, `statut`) VALUES
(1, 'valide'),
(2, 'annule'),
(3, 'en attente');

-- --------------------------------------------------------

--
-- Structure de la table `AnomalieType`
--

CREATE TABLE `AnomalieType` (
  `id` int(6) NOT NULL,
  `anoTypeNom` varchar(500) NOT NULL,
  `ecartNom` varchar(500) NOT NULL,
  `point` int(100) NOT NULL,
  `activité` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `AnomalieType`
--

INSERT INTO `AnomalieType` (`id`, `anoTypeNom`, `ecartNom`, `point`, `activité`) VALUES
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
-- Structure de la table `Employé`
--

CREATE TABLE `Employé` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL,
  `prenom` varchar(500) NOT NULL,
  `roleId` int(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `FluxType`
--

CREATE TABLE `FluxType` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `FluxType`
--

INSERT INTO `FluxType` (`id`, `nom`) VALUES
(1, 'Physique'),
(2, 'Numérique');

-- --------------------------------------------------------

--
-- Structure de la table `Image`
--

CREATE TABLE `Image` (
  `id` int(6) NOT NULL,
  `path` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `Role`
--

CREATE TABLE `Role` (
  `id` int(6) NOT NULL,
  `nom` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `Role`
--

INSERT INTO `Role` (`id`, `nom`) VALUES
(1, 'operateur'),
(2, 'chef d equipe');

-- --------------------------------------------------------

--
-- Structure de la table `test`
--

CREATE TABLE `test` (
  `id` int(6) NOT NULL,
  `name` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `Activité`
--
ALTER TABLE `Activité`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_flux_type` (`fluxTypeId`);

--
-- Index pour la table `ANOMALIE`
--
ALTER TABLE `ANOMALIE`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_anomalie_historique` (`anomalieHistorique`),
  ADD KEY `fk_anomalie_statue` (`anomalieStatueId`),
  ADD KEY `fk_anomalie_employe` (`operateurId`),
  ADD KEY `fk_anomalie_image` (`imageId`),
  ADD KEY `fk_anomalie_type` (`anomalieTypeId`);

--
-- Index pour la table `AnomalieHistorique`
--
ALTER TABLE `AnomalieHistorique`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `AnomalieStatut`
--
ALTER TABLE `AnomalieStatut`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `AnomalieType`
--
ALTER TABLE `AnomalieType`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_activite` (`activité`);

--
-- Index pour la table `Employé`
--
ALTER TABLE `Employé`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_role_operateur` (`roleId`);

--
-- Index pour la table `FluxType`
--
ALTER TABLE `FluxType`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Image`
--
ALTER TABLE `Image`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `Role`
--
ALTER TABLE `Role`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `ANOMALIE`
--
ALTER TABLE `ANOMALIE`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `AnomalieHistorique`
--
ALTER TABLE `AnomalieHistorique`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `AnomalieStatut`
--
ALTER TABLE `AnomalieStatut`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `AnomalieType`
--
ALTER TABLE `AnomalieType`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT pour la table `Employé`
--
ALTER TABLE `Employé`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `FluxType`
--
ALTER TABLE `FluxType`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `Image`
--
ALTER TABLE `Image`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `Role`
--
ALTER TABLE `Role`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(6) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `Activité`
--
ALTER TABLE `Activité`
  ADD CONSTRAINT `fk_flux_type` FOREIGN KEY (`fluxTypeId`) REFERENCES `FluxType` (`id`);

--
-- Contraintes pour la table `ANOMALIE`
--
ALTER TABLE `ANOMALIE`
  ADD CONSTRAINT `fk_anomalie_employe` FOREIGN KEY (`operateurId`) REFERENCES `Employé` (`id`),
  ADD CONSTRAINT `fk_anomalie_historique` FOREIGN KEY (`anomalieHistorique`) REFERENCES `AnomalieHistorique` (`id`),
  ADD CONSTRAINT `fk_anomalie_image` FOREIGN KEY (`imageId`) REFERENCES `Image` (`id`),
  ADD CONSTRAINT `fk_anomalie_statue` FOREIGN KEY (`anomalieStatueId`) REFERENCES `AnomalieStatut` (`id`),
  ADD CONSTRAINT `fk_anomalie_type` FOREIGN KEY (`anomalieTypeId`) REFERENCES `AnomalieType` (`id`);

--
-- Contraintes pour la table `AnomalieType`
--
ALTER TABLE `AnomalieType`
  ADD CONSTRAINT `fk_activite` FOREIGN KEY (`activité`) REFERENCES `Activité` (`id`);

--
-- Contraintes pour la table `Employé`
--
ALTER TABLE `Employé`
  ADD CONSTRAINT `fk_role_operateur` FOREIGN KEY (`roleId`) REFERENCES `Role` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

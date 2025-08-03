-- Script SQL pour appliquer la traduction française en dur
-- À exécuter dans votre base de données Gibbon
-- ATTENTION : Sauvegardez votre base avant d'exécuter !
-- PRÉREQUIS : Assurez-vous que la locale fr_FR.UTF-8 est installée sur le serveur
--   Linux: sudo locale-gen fr_FR.UTF-8
--   Windows: Exécutez install_french_windows.bat en tant qu'administrateur

-- 1. Changer la langue par défaut vers le français
UPDATE gibboni18n SET systemDefault='N';
UPDATE gibboni18n SET systemDefault='Y', installed='Y' WHERE code='fr_FR';

-- 2. Traduire les modules principaux
UPDATE gibbonModule SET name='Administration École', description='Permet aux administrateurs de configurer les paramètres de l\'école.' WHERE gibbonModuleID=0001;
UPDATE gibbonModule SET name='Administration Utilisateurs', description='Permet aux administrateurs de gérer les utilisateurs.' WHERE gibbonModuleID=0002;
UPDATE gibbonModule SET name='Administration Système', description='Permet aux administrateurs de configurer les paramètres système.' WHERE gibbonModuleID=0003;
UPDATE gibbonModule SET name='Départements', description='Voir les détails d\'un département' WHERE gibbonModuleID=0004;
UPDATE gibbonModule SET name='Élèves', description='Permet aux utilisateurs de voir les données des élèves' WHERE gibbonModuleID=0005;
UPDATE gibbonModule SET name='Présences', description='Prise des présences de l\'école' WHERE gibbonModuleID=0006;
UPDATE gibbonModule SET name='Carnet de notes', description='Un système pour suivre les notes' WHERE gibbonModuleID=0007;
UPDATE gibbonModule SET name='Mise à jour données', description='Permet aux utilisateurs de mettre à jour les données de leur famille' WHERE gibbonModuleID=0008;
UPDATE gibbonModule SET name='Planification', description='Supporte la planification des cours et le partage d\'informations pour le personnel, les élèves et les parents' WHERE gibbonModuleID=0009;
UPDATE gibbonModule SET name='Besoins individuels', description='Besoins individuels' WHERE gibbonModuleID=0011;
UPDATE gibbonModule SET name='Évaluation collaborative', description='Permet aux utilisateurs d\'évaluer le travail des autres' WHERE gibbonModuleID=0012;
UPDATE gibbonModule SET name='Administration Emploi du temps', description='Administration de l\'emploi du temps' WHERE gibbonModuleID=0013;
UPDATE gibbonModule SET name='Emploi du temps', description='Permet aux utilisateurs de voir les emplois du temps' WHERE gibbonModuleID=0014;
UPDATE gibbonModule SET name='Activités', description='Gérer un programme d\'activités scolaires' WHERE gibbonModuleID=0015;
UPDATE gibbonModule SET name='Évaluation formelle', description='Facilite le suivi des performances des élèves aux examens externes.' WHERE gibbonModuleID=0016;
UPDATE gibbonModule SET name='Comportement', description='Suivi du comportement des élèves' WHERE gibbonModuleID=0119;
UPDATE gibbonModule SET name='Messagerie', description='Messagerie unifiée pour email, mur de messages et plus.' WHERE gibbonModuleID=0121;
UPDATE gibbonModule SET name='Grilles d\'évaluation', description='Permet aux utilisateurs de créer des grilles d\'évaluation' WHERE gibbonModuleID=0126;
UPDATE gibbonModule SET name='Bibliothèque', description='Permet la gestion d\'un catalogue dont les éléments peuvent être empruntés.' WHERE gibbonModuleID=0130;
UPDATE gibbonModule SET name='Finance', description='Permet à une école d\'émettre des factures et de suivre les paiements.' WHERE gibbonModuleID=0135;
UPDATE gibbonModule SET name='Personnel', description='Permet aux utilisateurs de voir les informations du personnel' WHERE gibbonModuleID=0136;
UPDATE gibbonModule SET name='Groupes de classe', description='Permet aux utilisateurs de voir une liste des groupes de classe' WHERE gibbonModuleID=0137;
UPDATE gibbonModule SET name='Suivi', description='Fournit des graphiques visuels du progrès des élèves, enregistrés dans le Carnet de notes et l\'Évaluation interne.' WHERE gibbonModuleID=0141;
UPDATE gibbonModule SET name='Rapports', description='Rédaction de rapports et génération PDF' WHERE gibbonModuleID=0144;
UPDATE gibbonModule SET name='Admissions', description='Gestion des admissions et inscriptions' WHERE gibbonModuleID=0145;

-- 3. Nettoyer les sessions pour forcer la reconnexion
DELETE FROM gibbonSession WHERE gibbonPersonID IS NULL;

-- Affichage de confirmation
SELECT 'Traduction française appliquée avec succès!' as Message;
SELECT 'Langue par défaut:' as Info, name FROM gibboni18n WHERE systemDefault='Y';
SELECT 'Modules traduits:' as Info, COUNT(*) as NombreModules FROM gibbonModule WHERE name LIKE '%é%' OR name LIKE '%è%' OR name LIKE '%à%';
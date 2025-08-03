-- =====================================================
-- PLAN DE MIGRATION SÉCURISÉ VERS LE FRANÇAIS
-- Phase 1 : Préparation et Audit complet
-- =====================================================

-- 1. AUDIT DES TABLES CONTENANT DU TEXTE À TRADUIRE
SELECT 'AUDIT_TABLES_TEXTE' as Phase;

-- Tables critiques identifiées avec colonnes textuelles
CREATE TEMPORARY TABLE IF NOT EXISTS audit_tables AS
SELECT 
    'gibbonAction' as table_name, 
    'name,description,category' as text_columns,
    'Actions/Pages du système' as description_fr
UNION ALL SELECT 'gibbonModule', 'name,description', 'Modules principaux'
UNION ALL SELECT 'gibbonRole', 'name,description', 'Rôles utilisateurs'
UNION ALL SELECT 'gibbonSetting', 'nameDisplay,description', 'Paramètres système'
UNION ALL SELECT 'gibbonAlertLevel', 'name,description', 'Niveaux d\'alerte'
UNION ALL SELECT 'gibbonDepartment', 'name,nameShort', 'Départements'
UNION ALL SELECT 'gibbonYearGroup', 'name,nameShort', 'Groupes d\'années'
UNION ALL SELECT 'gibbonRollGroup', 'name,nameShort', 'Groupes de classe'
UNION ALL SELECT 'gibbonAttendanceCode', 'name,nameShort,description', 'Codes de présence'
UNION ALL SELECT 'gibbonBehaviourLevel', 'name', 'Niveaux de comportement'
UNION ALL SELECT 'gibbonFinanceFeeCategoryType', 'name', 'Types de frais'
UNION ALL SELECT 'gibbonLibraryType', 'name', 'Types de bibliothèque'
UNION ALL SELECT 'gibbonMessengerTarget', 'name', 'Cibles de messagerie'
UNION ALL SELECT 'gibbonScale', 'name,nameShort,description', 'Échelles de notation'
UNION ALL SELECT 'gibbonScaleGrade', 'value,descriptor', 'Notes d\'échelle'
UNION ALL SELECT 'gibboni18n', 'name', 'Langues système';

-- Afficher l'audit
SELECT * FROM audit_tables ORDER BY table_name;

-- =====================================================
-- Phase 2 : Création de l'infrastructure de migration
-- =====================================================

-- 2. CRÉER LA TABLE DE TRADUCTIONS CENTRALISÉE
CREATE TABLE IF NOT EXISTS gibbonTranslation (
    gibbonTranslationID int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    sourceTable varchar(60) NOT NULL COMMENT 'Table source des données',
    sourceColumn varchar(60) NOT NULL COMMENT 'Colonne source',
    sourceID varchar(20) NOT NULL COMMENT 'ID de l\'enregistrement source',
    languageCode varchar(5) NOT NULL DEFAULT 'fr_FR' COMMENT 'Code langue cible',
    originalText text COMMENT 'Texte original pour référence',
    translatedText text COMMENT 'Texte traduit',
    translationStatus enum('PENDING','COMPLETED','VERIFIED') DEFAULT 'PENDING',
    createdBy int(8) UNSIGNED ZEROFILL DEFAULT NULL,
    createdOn timestamp DEFAULT CURRENT_TIMESTAMP,
    updatedBy int(8) UNSIGNED ZEROFILL DEFAULT NULL,
    updatedOn timestamp DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (gibbonTranslationID),
    UNIQUE KEY translation_unique (sourceTable, sourceColumn, sourceID, languageCode),
    KEY idx_table_column (sourceTable, sourceColumn),
    KEY idx_language (languageCode),
    KEY idx_status (translationStatus)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='Table centralisée des traductions';

-- 3. AJOUTER COLONNES FRANÇAISES AVEC COMPATIBILITÉ
-- Modules
ALTER TABLE gibbonModule 
ADD COLUMN name_fr varchar(30) NULL AFTER name,
ADD COLUMN description_fr text NULL AFTER description;

-- Actions
ALTER TABLE gibbonAction 
ADD COLUMN name_fr varchar(50) NULL AFTER name,
ADD COLUMN description_fr varchar(255) NULL AFTER description,
ADD COLUMN category_fr varchar(20) NULL AFTER category;

-- Rôles
ALTER TABLE gibbonRole 
ADD COLUMN name_fr varchar(20) NULL AFTER name,
ADD COLUMN description_fr varchar(60) NULL AFTER description;

-- Paramètres
ALTER TABLE gibbonSetting 
ADD COLUMN nameDisplay_fr varchar(60) NULL AFTER nameDisplay,
ADD COLUMN description_fr text NULL AFTER description;

-- Départements
ALTER TABLE gibbonDepartment 
ADD COLUMN name_fr varchar(40) NULL AFTER name,
ADD COLUMN nameShort_fr varchar(4) NULL AFTER nameShort;

-- Codes de présence
ALTER TABLE gibbonAttendanceCode 
ADD COLUMN name_fr varchar(30) NULL AFTER name,
ADD COLUMN nameShort_fr varchar(4) NULL AFTER nameShort,
ADD COLUMN description_fr varchar(255) NULL AFTER description;

SELECT 'INFRASTRUCTURE_CRÉÉE' as Status, 'Colonnes françaises ajoutées' as Detail;

-- =====================================================
-- Phase 3 : Population des traductions (Sécurisé)
-- =====================================================

-- 4. PEUPLER LES TRADUCTIONS SANS CASSER L'EXISTANT

-- Modules principaux (garder les originaux intacts)
UPDATE gibbonModule SET 
    name_fr = CASE 
        WHEN name = 'School Admin' THEN 'Administration École'
        WHEN name = 'User Admin' THEN 'Administration Utilisateurs'
        WHEN name = 'System Admin' THEN 'Administration Système'
        WHEN name = 'Students' THEN 'Élèves'
        WHEN name = 'Attendance' THEN 'Présences'
        WHEN name = 'Markbook' THEN 'Carnet de notes'
        WHEN name = 'Planner' THEN 'Planification'
        WHEN name = 'Activities' THEN 'Activités'
        WHEN name = 'Behaviour' THEN 'Comportement'
        WHEN name = 'Messenger' THEN 'Messagerie'
        WHEN name = 'Library' THEN 'Bibliothèque'
        WHEN name = 'Staff' THEN 'Personnel'
        WHEN name = 'Departments' THEN 'Départements'
        WHEN name = 'Reports' THEN 'Rapports'
        WHEN name = 'Finance' THEN 'Finance'
        WHEN name = 'Form Groups' THEN 'Groupes de classe'
        WHEN name = 'Timetable Admin' THEN 'Administration Emploi du temps'
        WHEN name = 'Timetable' THEN 'Emploi du temps'
        WHEN name = 'Admissions' THEN 'Admissions'
        WHEN name = 'Individual Needs' THEN 'Besoins individuels'
        WHEN name = 'Crowd Assessment' THEN 'Évaluation collaborative'
        WHEN name = 'Formal Assessment' THEN 'Évaluation formelle'
        WHEN name = 'Data Updater' THEN 'Mise à jour données'
        WHEN name = 'Rubrics' THEN 'Grilles d\'évaluation'
        WHEN name = 'Tracking' THEN 'Suivi'
        ELSE name_fr
    END,
    description_fr = CASE 
        WHEN name = 'School Admin' THEN 'Permet aux administrateurs de configurer les paramètres de l\'école.'
        WHEN name = 'User Admin' THEN 'Permet aux administrateurs de gérer les utilisateurs.'
        WHEN name = 'System Admin' THEN 'Permet aux administrateurs de configurer les paramètres système.'
        WHEN name = 'Students' THEN 'Permet aux utilisateurs de voir les données des élèves'
        WHEN name = 'Attendance' THEN 'Prise des présences de l\'école'
        WHEN name = 'Markbook' THEN 'Un système pour suivre les notes'
        WHEN name = 'Planner' THEN 'Supporte la planification des cours et le partage d\'informations'
        WHEN name = 'Activities' THEN 'Gérer un programme d\'activités scolaires'
        WHEN name = 'Behaviour' THEN 'Suivi du comportement des élèves'
        WHEN name = 'Messenger' THEN 'Messagerie unifiée pour email, mur de messages et plus'
        WHEN name = 'Library' THEN 'Permet la gestion d\'un catalogue dont les éléments peuvent être empruntés'
        WHEN name = 'Staff' THEN 'Permet aux utilisateurs de voir les informations du personnel'
        WHEN name = 'Departments' THEN 'Voir les détails d\'un département'
        WHEN name = 'Reports' THEN 'Rédaction de rapports et génération PDF'
        WHEN name = 'Finance' THEN 'Permet à une école d\'émettre des factures et de suivre les paiements'
        ELSE description_fr
    END;

-- Rôles principaux
UPDATE gibbonRole SET 
    name_fr = CASE 
        WHEN name = 'Administrator' THEN 'Administrateur'
        WHEN name = 'Teacher' THEN 'Enseignant'
        WHEN name = 'Student' THEN 'Élève'
        WHEN name = 'Parent' THEN 'Parent'
        WHEN name = 'Support Staff' THEN 'Personnel de soutien'
        ELSE name_fr
    END,
    description_fr = CASE 
        WHEN name = 'Administrator' THEN 'Accès administrateur complet'
        WHEN name = 'Teacher' THEN 'Accès enseignant aux classes et notes'
        WHEN name = 'Student' THEN 'Accès élève aux cours et devoirs'
        WHEN name = 'Parent' THEN 'Accès parent au suivi des enfants'
        ELSE description_fr
    END;

-- Actions critiques (seulement les plus importantes)
UPDATE gibbonAction SET 
    name_fr = CASE 
        WHEN name LIKE '%Manage%' THEN REPLACE(name, 'Manage', 'Gérer')
        WHEN name LIKE '%Add%' THEN REPLACE(name, 'Add', 'Ajouter')
        WHEN name LIKE '%Edit%' THEN REPLACE(name, 'Edit', 'Modifier')
        WHEN name LIKE '%Delete%' THEN REPLACE(name, 'Delete', 'Supprimer')
        WHEN name LIKE '%View%' THEN REPLACE(name, 'View', 'Voir')
        ELSE name_fr
    END,
    category_fr = CASE 
        WHEN category = 'User Management' THEN 'Gestion Utilisateurs'
        WHEN category = 'Student Management' THEN 'Gestion Élèves'
        WHEN category = 'Settings' THEN 'Paramètres'
        WHEN category = 'Reports' THEN 'Rapports'
        WHEN category = 'Admin' THEN 'Administration'
        WHEN category = 'Markbook' THEN 'Carnet de notes'
        WHEN category = 'Attendance' THEN 'Présences'
        ELSE category_fr
    END;

-- 5. CONFIGURER LE FRANÇAIS COMME LANGUE PAR DÉFAUT
UPDATE gibboni18n SET systemDefault='N' WHERE systemDefault='Y';
UPDATE gibboni18n SET systemDefault='Y', installed='Y' WHERE code='fr_FR';

-- 6. CRÉER LES VUES DE COMPATIBILITÉ POUR BASCULER ENTRE LANGUES
CREATE OR REPLACE VIEW gibbonModule_display AS
SELECT 
    gibbonModuleID,
    CASE 
        WHEN (SELECT systemDefault FROM gibboni18n WHERE code='fr_FR') = 'Y' 
        THEN COALESCE(name_fr, name)
        ELSE name
    END as name,
    CASE 
        WHEN (SELECT systemDefault FROM gibboni18n WHERE code='fr_FR') = 'Y' 
        THEN COALESCE(description_fr, description)
        ELSE description
    END as description,
    entryURL, type, active, category, version, author, url
FROM gibbonModule;

SELECT 'MIGRATION_SÉCURISÉE_TERMINÉE' as Status, 
       'Français configuré avec compatibilité' as Detail;

-- =====================================================
-- Phase 4 : Vérification et Tests
-- =====================================================

-- Tests de compatibilité
SELECT 'TEST_LANGUES' as Test, code, name, systemDefault, installed FROM gibboni18n;
SELECT 'TEST_MODULES' as Test, name, name_fr FROM gibbonModule WHERE active='Y' LIMIT 10;
SELECT 'TEST_ROLES' as Test, name, name_fr FROM gibbonRole LIMIT 5;

-- Statistiques de traduction
SELECT 'STATS_TRADUCTION' as Type,
    (SELECT COUNT(*) FROM gibbonModule WHERE name_fr IS NOT NULL) as ModulesTraduits,
    (SELECT COUNT(*) FROM gibbonModule) as TotalModules,
    (SELECT COUNT(*) FROM gibbonRole WHERE name_fr IS NOT NULL) as RolesTraduits,
    (SELECT COUNT(*) FROM gibbonRole) as TotalRoles;

SELECT 'MIGRATION_PLAN_TERMINÉ' as Final_Status;
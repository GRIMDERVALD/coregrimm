-- Script pour vérifier l'état de la traduction française
-- À exécuter pour voir l'état actuel

-- 1. Vérifier la langue par défaut
SELECT 
    'LANGUE PAR DÉFAUT' as Type,
    code as Code,
    name as Nom,
    systemDefault as ParDefaut,
    installed as Installe,
    active as Actif
FROM gibboni18n 
WHERE systemDefault='Y' OR code='fr_FR' OR code='en_GB'
ORDER BY systemDefault DESC;

-- 2. Vérifier les modules traduits
SELECT 
    'MODULES TRADUITS' as Type,
    gibbonModuleID as ID,
    name as Nom,
    CASE 
        WHEN name LIKE '%é%' OR name LIKE '%è%' OR name LIKE '%à%' OR name LIKE '%ç%' THEN 'FRANÇAIS'
        ELSE 'ANGLAIS'
    END as Langue
FROM gibbonModule 
WHERE active='Y' 
ORDER BY gibbonModuleID;

-- 3. Statistiques de traduction
SELECT 
    'STATISTIQUES' as Type,
    COUNT(*) as TotalModules,
    SUM(CASE WHEN name LIKE '%é%' OR name LIKE '%è%' OR name LIKE '%à%' OR name LIKE '%ç%' THEN 1 ELSE 0 END) as ModulesFrancais,
    ROUND(
        (SUM(CASE WHEN name LIKE '%é%' OR name LIKE '%è%' OR name LIKE '%à%' OR name LIKE '%ç%' THEN 1 ELSE 0 END) * 100.0 / COUNT(*)), 
        2
    ) as PourcentageFrancais
FROM gibbonModule 
WHERE active='Y';
-- =====================================================
-- SCRIPT DE TEST DE LA MIGRATION FRANÇAISE
-- À exécuter APRÈS la migration pour vérifier
-- =====================================================

-- 1. TEST DES LANGUES SYSTÈME
SELECT '=== TEST LANGUES SYSTÈME ===' as Test;
SELECT 
    code as 'Code Langue',
    name as 'Nom',
    systemDefault as 'Par Défaut',
    installed as 'Installé',
    active as 'Actif'
FROM gibboni18n 
ORDER BY systemDefault DESC, code;

-- 2. TEST DES MODULES TRADUITS
SELECT '=== TEST MODULES TRADUITS ===' as Test;
SELECT 
    gibbonModuleID as 'ID',
    name as 'Nom Original',
    name_fr as 'Nom Français',
    CASE WHEN name_fr IS NOT NULL THEN '✓' ELSE '✗' END as 'Traduit'
FROM gibbonModule 
WHERE active='Y'
ORDER BY name;

-- 3. TEST DES RÔLES TRADUITS
SELECT '=== TEST RÔLES TRADUITS ===' as Test;
SELECT 
    gibbonRoleID as 'ID',
    name as 'Nom Original',
    name_fr as 'Nom Français',
    CASE WHEN name_fr IS NOT NULL THEN '✓' ELSE '✗' END as 'Traduit'
FROM gibbonRole 
ORDER BY name;

-- 4. TEST DES ACTIONS CRITIQUES
SELECT '=== TEST ACTIONS CRITIQUES ===' as Test;
SELECT 
    gibbonActionID as 'ID',
    name as 'Action Originale',
    name_fr as 'Action Française',
    category as 'Catégorie Originale',
    category_fr as 'Catégorie Française'
FROM gibbonAction 
WHERE gibbonModuleID IN (1,2,3,5,6,7,9,15,119,121,130,135,144)
AND name_fr IS NOT NULL
LIMIT 20;

-- 5. STATISTIQUES GLOBALES
SELECT '=== STATISTIQUES TRADUCTION ===' as Test;
SELECT 
    'Modules' as 'Type',
    COUNT(*) as 'Total',
    SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END) as 'Traduits',
    ROUND(SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1) as '% Traduits'
FROM gibbonModule WHERE active='Y'
UNION ALL
SELECT 
    'Rôles',
    COUNT(*),
    SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END),
    ROUND(SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1)
FROM gibbonRole
UNION ALL
SELECT 
    'Actions',
    COUNT(*),
    SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END),
    ROUND(SUM(CASE WHEN name_fr IS NOT NULL THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 1)
FROM gibbonAction;

-- 6. TEST DE LA NOUVELLE INFRASTRUCTURE
SELECT '=== TEST INFRASTRUCTURE ===' as Test;
SELECT 
    CASE WHEN COUNT(*) > 0 THEN '✓ Table gibbonTranslation créée' ELSE '✗ Table manquante' END as 'Table Traductions'
FROM information_schema.tables 
WHERE table_schema = DATABASE() AND table_name = 'gibbonTranslation';

-- Vérifier les nouvelles colonnes
SELECT 
    table_name as 'Table',
    column_name as 'Colonne Française',
    '✓' as 'Créée'
FROM information_schema.columns 
WHERE table_schema = DATABASE() 
AND column_name LIKE '%_fr'
ORDER BY table_name, column_name;

-- 7. TEST DE COMPATIBILITÉ (vérifier que l'ancien système fonctionne encore)
SELECT '=== TEST COMPATIBILITÉ ===' as Test;
SELECT 
    'Modules originaux' as 'Test',
    CASE WHEN COUNT(*) > 0 THEN '✓ Données originales préservées' ELSE '✗ Problème' END as 'Résultat'
FROM gibbonModule 
WHERE name IS NOT NULL AND name != '';

-- 8. RECOMMANDATIONS POST-MIGRATION
SELECT '=== RECOMMANDATIONS ===' as Test;
SELECT 
    CASE 
        WHEN (SELECT systemDefault FROM gibboni18n WHERE code='fr_FR') = 'Y' 
        THEN '✓ Français activé comme langue par défaut'
        ELSE '⚠ Activer le français comme langue par défaut'
    END as 'Statut Langue',
    CASE 
        WHEN (SELECT COUNT(*) FROM gibbonModule WHERE name_fr IS NOT NULL) > 10
        THEN '✓ Modules principaux traduits'
        ELSE '⚠ Compléter la traduction des modules'
    END as 'Statut Modules';

SELECT 'TEST_MIGRATION_TERMINÉ' as Final_Status;
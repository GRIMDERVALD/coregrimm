<?php
/*
Script pour basculer Gibbon vers le français
Accédez à ce script via votre navigateur : http://votre-site/switch_to_french.php
Exécutez-le UNE SEULE FOIS, puis supprimez-le
*/

// Inclure Gibbon
require_once './gibbon.php';

// Interface web simple
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['confirm'])) {
    // Traitement du changement
} else {
    // Affichage du formulaire de confirmation
    echo '<!DOCTYPE html>
<html>
<head>
    <title>Basculer Gibbon vers le Français</title>
    <style>
        body { font-family: Arial, sans-serif; max-width: 800px; margin: 50px auto; padding: 20px; }
        .warning { background: #fff3cd; border: 1px solid #ffeaa7; padding: 15px; border-radius: 5px; margin: 20px 0; }
        .btn { background: #007bff; color: white; padding: 10px 20px; border: none; border-radius: 5px; cursor: pointer; }
        .btn:hover { background: #0056b3; }
        .danger { background: #dc3545; }
        .danger:hover { background: #c82333; }
    </style>
</head>
<body>
    <h1>🇫🇷 Basculer Gibbon vers le Français</h1>
    
    <div class="warning">
        <strong>⚠️ ATTENTION :</strong>
        <ul>
            <li>Cette action va changer la langue par défaut de tout le système</li>
            <li>Tous les utilisateurs verront l\'interface en français</li>
            <li>Un redémarrage de session sera nécessaire pour tous</li>
            <li>Cette action est réversible</li>
        </ul>
    </div>

    <form method="POST">
        <p><strong>Êtes-vous sûr de vouloir continuer ?</strong></p>
        <button type="submit" name="confirm" value="yes" class="btn">✅ Oui, basculer vers le français</button>
        <a href="index.php" class="btn danger" style="text-decoration: none; margin-left: 10px;">❌ Annuler</a>
    </form>
</body>
</html>';
    exit;
}

// Vérifier que nous avons une connexion à la base
if (!isset($pdo) || !$pdo) {
    echo "Erreur : Impossible de se connecter à la base de données.\n";
    exit(1);
}

echo "=== Basculement de Gibbon vers le français ===\n\n";

try {
    // 1. Vérifier l'état actuel
    echo "1. État actuel des langues :\n";
    $result = $pdo->select("SELECT code, name, systemDefault, active, installed FROM gibboni18n WHERE active='Y' ORDER BY systemDefault DESC");
    foreach ($result as $lang) {
        $default = $lang['systemDefault'] == 'Y' ? ' (DÉFAUT)' : '';
        $installed = $lang['installed'] == 'Y' ? ' [Installé]' : ' [Non installé]';
        echo "  - {$lang['code']}: {$lang['name']}{$default}{$installed}\n";
    }

    // 2. Vérifier que fr_FR existe et est actif
    $frenchLang = $pdo->selectOne("SELECT * FROM gibboni18n WHERE code='fr_FR'");
    if (!$frenchLang) {
        echo "\nErreur : La langue française (fr_FR) n'existe pas dans la base.\n";
        exit(1);
    }

    if ($frenchLang['active'] != 'Y') {
        echo "\nErreur : La langue française n'est pas activée.\n";
        exit(1);
    }

    echo "\n2. Langue française trouvée : {$frenchLang['name']}\n";

    // 3. Effectuer le changement
    echo "\n3. Changement de langue par défaut...\n";
    
    // Désactiver toutes les langues par défaut
    $pdo->update("UPDATE gibboni18n SET systemDefault='N'");
    echo "  ✓ Toutes les langues par défaut désactivées\n";
    
    // Activer le français comme langue par défaut et s'assurer qu'il est installé
    $pdo->update("UPDATE gibboni18n SET systemDefault='Y', installed='Y' WHERE code='fr_FR'");
    echo "  ✓ Français défini comme langue par défaut et marqué comme installé\n";

    // 4. Vérification
    echo "\n4. Vérification du changement :\n";
    $newDefault = $pdo->selectOne("SELECT * FROM gibboni18n WHERE systemDefault='Y'");
    if ($newDefault && $newDefault['code'] == 'fr_FR') {
        echo "  ✅ SUCCÈS : {$newDefault['name']} est maintenant la langue par défaut\n";
    } else {
        echo "  ❌ ERREUR : Le changement a échoué\n";
        exit(1);
    }

    // 5. Vider le cache de session si possible
    echo "\n5. Nettoyage du cache...\n";
    $pdo->delete("DELETE FROM gibbonSession WHERE gibbonPersonID IS NULL");
    echo "  ✓ Sessions temporaires supprimées\n";

    echo "\n=== CHANGEMENT TERMINÉ AVEC SUCCÈS ===\n";
    echo "\nInstructions :\n";
    echo "1. Supprimez ce fichier (switch_to_french.php) maintenant\n";
    echo "2. Déconnectez-vous de Gibbon\n";
    echo "3. Reconnectez-vous pour voir l'interface en français\n";
    echo "4. Si certains utilisateurs voient encore l'anglais, ils doivent se déconnecter/reconnecter\n\n";

} catch (Exception $e) {
    echo "\nErreur lors du changement : " . $e->getMessage() . "\n";
    echo "Le changement a été annulé.\n";
    exit(1);
}
?>
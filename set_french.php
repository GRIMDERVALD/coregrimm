<?php
// Script simple pour passer Gibbon en français
require_once './gibbon.php';

try {
    // Désactiver l'anglais comme langue par défaut
    $pdo->update("UPDATE gibboni18n SET systemDefault='N' WHERE systemDefault='Y'");
    
    // Activer le français comme langue par défaut
    $pdo->update("UPDATE gibboni18n SET systemDefault='Y', installed='Y' WHERE code='fr_FR'");
    
    echo "✅ Gibbon est maintenant en français !<br>";
    echo "📝 Déconnectez-vous et reconnectez-vous pour voir le changement.<br>";
    echo "🗑️ Vous pouvez supprimer ce fichier maintenant.<br>";
    echo '<a href="index.php">Retour à Gibbon</a>';
    
} catch (Exception $e) {
    echo "❌ Erreur : " . $e->getMessage();
}
?>
<?php
/*
Script de traduction en dur vers le français
Traduit directement dans le code tous les textes anglais vers le français
ATTENTION : Sauvegardez avant d'utiliser !
*/

require_once './gibbon.php';

// Dictionnaire de traductions principales
$translations = [
    // Navigation et menus
    'Dashboard' => 'Tableau de bord',
    'School Admin' => 'Administration École',
    'User Admin' => 'Administration Utilisateurs',
    'Students' => 'Élèves',
    'Staff' => 'Personnel',
    'Parents' => 'Parents',
    'Activities' => 'Activités',
    'Attendance' => 'Présences',
    'Behaviour' => 'Comportement',
    'Markbook' => 'Carnet de notes',
    'Planner' => 'Planification',
    'Reports' => 'Rapports',
    'Timetable' => 'Emploi du temps',
    'Finance' => 'Finance',
    'Library' => 'Bibliothèque',
    'Messenger' => 'Messagerie',
    'Form Groups' => 'Groupes de classe',
    'Departments' => 'Départements',
    'Data Updater' => 'Mise à jour données',
    'Individual Needs' => 'Besoins individuels',
    'Formal Assessment' => 'Évaluation formelle',
    'Crowd Assessment' => 'Évaluation collaborative',
    'Rubrics' => 'Grilles d\'évaluation',
    'Admissions' => 'Admissions',
    
    // Actions communes
    'Add' => 'Ajouter',
    'Edit' => 'Modifier',
    'Delete' => 'Supprimer',
    'View' => 'Voir',
    'Search' => 'Rechercher',
    'Save' => 'Enregistrer',
    'Cancel' => 'Annuler',
    'Submit' => 'Soumettre',
    'Update' => 'Mettre à jour',
    'Create' => 'Créer',
    'Manage' => 'Gérer',
    'Settings' => 'Paramètres',
    'Preferences' => 'Préférences',
    'Login' => 'Connexion',
    'Logout' => 'Déconnexion',
    'Username' => 'Nom d\'utilisateur',
    'Password' => 'Mot de passe',
    'Email' => 'Email',
    'Phone' => 'Téléphone',
    'Address' => 'Adresse',
    'Name' => 'Nom',
    'First Name' => 'Prénom',
    'Last Name' => 'Nom de famille',
    'Date' => 'Date',
    'Time' => 'Heure',
    'Status' => 'Statut',
    'Active' => 'Actif',
    'Inactive' => 'Inactif',
    'Yes' => 'Oui',
    'No' => 'Non',
    'Male' => 'Masculin',
    'Female' => 'Féminin',
    'Other' => 'Autre',
    
    // Messages système
    'Please fill out this field.' => 'Veuillez remplir ce champ.',
    'Invalid input.' => 'Saisie invalide.',
    'Record not found.' => 'Enregistrement introuvable.',
    'Access denied.' => 'Accès refusé.',
    'Operation successful.' => 'Opération réussie.',
    'Operation failed.' => 'Opération échouée.',
    'Required field.' => 'Champ obligatoire.',
    'Select an option.' => 'Sélectionnez une option.',
    'Loading...' => 'Chargement...',
    'Search results' => 'Résultats de recherche',
    'No records found.' => 'Aucun enregistrement trouvé.',
    'Total records' => 'Total des enregistrements',
    'Records per page' => 'Enregistrements par page',
    'Page' => 'Page',
    'of' => 'de',
    'First' => 'Premier',
    'Previous' => 'Précédent',
    'Next' => 'Suivant',
    'Last' => 'Dernier',
    
    // Notifications
    'Information' => 'Information',
    'Warning' => 'Avertissement',
    'Error' => 'Erreur',
    'Success' => 'Succès',
    'Confirmation' => 'Confirmation',
    'Are you sure?' => 'Êtes-vous sûr ?',
    'This action cannot be undone.' => 'Cette action ne peut pas être annulée.',
    'Continue' => 'Continuer',
    'Go back' => 'Retour',
    
    // Calendrier et dates
    'January' => 'Janvier',
    'February' => 'Février',
    'March' => 'Mars',
    'April' => 'Avril',
    'May' => 'Mai',
    'June' => 'Juin',
    'July' => 'Juillet',
    'August' => 'Août',
    'September' => 'Septembre',
    'October' => 'Octobre',
    'November' => 'Novembre',
    'December' => 'Décembre',
    'Monday' => 'Lundi',
    'Tuesday' => 'Mardi',
    'Wednesday' => 'Mercredi',
    'Thursday' => 'Jeudi',
    'Friday' => 'Vendredi',
    'Saturday' => 'Samedi',
    'Sunday' => 'Dimanche',
    'Today' => 'Aujourd\'hui',
    'Tomorrow' => 'Demain',
    'Yesterday' => 'Hier',
    'This week' => 'Cette semaine',
    'This month' => 'Ce mois',
    'This year' => 'Cette année',
    
    // Éducation spécifique
    'School Year' => 'Année scolaire',
    'Term' => 'Trimestre',
    'Class' => 'Classe',
    'Subject' => 'Matière',
    'Grade' => 'Note',
    'Assignment' => 'Devoir',
    'Homework' => 'Devoirs',
    'Lesson' => 'Cours',
    'Unit' => 'Unité',
    'Course' => 'Cours',
    'Teacher' => 'Enseignant',
    'Student' => 'Élève',
    'Parent' => 'Parent',
    'Guardian' => 'Tuteur',
    'Administrator' => 'Administrateur',
    'Present' => 'Présent',
    'Absent' => 'Absent',
    'Late' => 'En retard',
    'Excuse' => 'Excuse',
    'Medical' => 'Médical',
    'Family' => 'Famille',
    'Emergency' => 'Urgence',
    'Contact' => 'Contact',
    'Photo' => 'Photo',
    'Documents' => 'Documents',
    'Notes' => 'Notes',
    'Comments' => 'Commentaires',
    'Description' => 'Description',
    'Details' => 'Détails',
    'Summary' => 'Résumé',
    'Overview' => 'Aperçu',
    'Profile' => 'Profil',
    'History' => 'Historique',
    'Schedule' => 'Planning',
    'Calendar' => 'Calendrier',
    'Events' => 'Événements',
    'Announcements' => 'Annonces',
    'News' => 'Actualités',
    'Messages' => 'Messages',
    'Notifications' => 'Notifications',
    'Alerts' => 'Alertes',
    'Help' => 'Aide',
    'Support' => 'Support',
    'About' => 'À propos',
    'Version' => 'Version',
    'License' => 'Licence',
    'Terms' => 'Conditions',
    'Privacy' => 'Confidentialité',
    'Security' => 'Sécurité',
    'Backup' => 'Sauvegarde',
    'Import' => 'Importer',
    'Export' => 'Exporter',
    'Print' => 'Imprimer',
    'Download' => 'Télécharger',
    'Upload' => 'Téléverser',
    'File' => 'Fichier',
    'Image' => 'Image',
    'Video' => 'Vidéo',
    'Audio' => 'Audio',
    'Link' => 'Lien',
    'URL' => 'URL',
    'Website' => 'Site web',
    'Application' => 'Application',
    'System' => 'Système',
    'Database' => 'Base de données',
    'Configuration' => 'Configuration',
    'Installation' => 'Installation',
    'Update' => 'Mise à jour',
    'Upgrade' => 'Mise à niveau',
    'Maintenance' => 'Maintenance',
    'Tools' => 'Outils',
    'Utilities' => 'Utilitaires',
    'Statistics' => 'Statistiques',
    'Analytics' => 'Analyses',
    'Performance' => 'Performance',
    'Monitoring' => 'Surveillance',
    'Logs' => 'Journaux',
    'Debug' => 'Débogage',
    'Testing' => 'Tests',
    'Quality' => 'Qualité',
    'Standards' => 'Standards',
    'Policies' => 'Politiques',
    'Procedures' => 'Procédures',
    'Guidelines' => 'Directives',
    'Manual' => 'Manuel',
    'Documentation' => 'Documentation',
    'Tutorial' => 'Tutoriel',
    'Guide' => 'Guide',
    'FAQ' => 'FAQ',
    'Troubleshooting' => 'Dépannage',
    'Recovery' => 'Récupération',
    'Restore' => 'Restaurer',
    'Reset' => 'Réinitialiser',
    'Clear' => 'Effacer',
    'Remove' => 'Retirer',
    'Disable' => 'Désactiver',
    'Enable' => 'Activer',
    'Install' => 'Installer',
    'Uninstall' => 'Désinstaller',
    'Configure' => 'Configurer',
    'Setup' => 'Configuration',
    'Initialize' => 'Initialiser',
    'Start' => 'Démarrer',
    'Stop' => 'Arrêter',
    'Pause' => 'Pause',
    'Resume' => 'Reprendre',
    'Restart' => 'Redémarrer',
    'Refresh' => 'Actualiser',
    'Reload' => 'Recharger',
    'Sync' => 'Synchroniser',
    'Validate' => 'Valider',
    'Verify' => 'Vérifier',
    'Check' => 'Vérifier',
    'Test' => 'Tester',
    'Preview' => 'Aperçu',
    'Review' => 'Réviser',
    'Approve' => 'Approuver',
    'Reject' => 'Rejeter',
    'Accept' => 'Accepter',
    'Decline' => 'Décliner',
    'Confirm' => 'Confirmer',
    'Deny' => 'Refuser',
    'Grant' => 'Accorder',
    'Revoke' => 'Révoquer',
    'Assign' => 'Assigner',
    'Unassign' => 'Désassigner',
    'Transfer' => 'Transférer',
    'Move' => 'Déplacer',
    'Copy' => 'Copier',
    'Duplicate' => 'Dupliquer',
    'Clone' => 'Cloner',
    'Merge' => 'Fusionner',
    'Split' => 'Diviser',
    'Join' => 'Joindre',
    'Leave' => 'Quitter',
    'Enter' => 'Entrer',
    'Exit' => 'Sortir',
    'Open' => 'Ouvrir',
    'Close' => 'Fermer',
    'Expand' => 'Développer',
    'Collapse' => 'Réduire',
    'Show' => 'Afficher',
    'Hide' => 'Masquer',
    'Toggle' => 'Basculer',
    'Switch' => 'Commuter',
    'Change' => 'Changer',
    'Replace' => 'Remplacer',
    'Substitute' => 'Substituer',
    'Transform' => 'Transformer',
    'Convert' => 'Convertir',
    'Translate' => 'Traduire',
    'Interpret' => 'Interpréter',
    'Encode' => 'Encoder',
    'Decode' => 'Décoder',
    'Encrypt' => 'Chiffrer',
    'Decrypt' => 'Déchiffrer',
    'Compress' => 'Compresser',
    'Decompress' => 'Décompresser',
    'Archive' => 'Archiver',
    'Extract' => 'Extraire',
    'Package' => 'Empaqueter',
    'Unpack' => 'Déballer',
    'Build' => 'Construire',
    'Compile' => 'Compiler',
    'Deploy' => 'Déployer',
    'Release' => 'Publier',
    'Publish' => 'Publier',
    'Subscribe' => 'S\'abonner',
    'Unsubscribe' => 'Se désabonner',
    'Follow' => 'Suivre',
    'Unfollow' => 'Ne plus suivre',
    'Like' => 'Aimer',
    'Unlike' => 'Ne plus aimer',
    'Share' => 'Partager',
    'Comment' => 'Commenter',
    'Reply' => 'Répondre',
    'Forward' => 'Transférer',
    'Send' => 'Envoyer',
    'Receive' => 'Recevoir',
    'Deliver' => 'Livrer',
    'Return' => 'Retourner',
    'Exchange' => 'Échanger',
    'Trade' => 'Échanger',
    'Buy' => 'Acheter',
    'Sell' => 'Vendre',
    'Purchase' => 'Acheter',
    'Order' => 'Commander',
    'Ship' => 'Expédier',
    'Track' => 'Suivre',
    'Monitor' => 'Surveiller',
    'Watch' => 'Regarder',
    'Observe' => 'Observer',
    'Listen' => 'Écouter',
    'Hear' => 'Entendre',
    'Speak' => 'Parler',
    'Talk' => 'Parler',
    'Say' => 'Dire',
    'Tell' => 'Dire',
    'Ask' => 'Demander',
    'Answer' => 'Répondre',
    'Question' => 'Question',
    'Response' => 'Réponse',
    'Request' => 'Demande',
    'Proposal' => 'Proposition',
    'Suggestion' => 'Suggestion',
    'Recommendation' => 'Recommandation',
    'Advice' => 'Conseil',
    'Tip' => 'Conseil',
    'Hint' => 'Indice',
    'Clue' => 'Indice',
    'Evidence' => 'Preuve',
    'Proof' => 'Preuve',
    'Example' => 'Exemple',
    'Sample' => 'Échantillon',
    'Template' => 'Modèle',
    'Pattern' => 'Modèle',
    'Format' => 'Format',
    'Style' => 'Style',
    'Theme' => 'Thème',
    'Layout' => 'Mise en page',
    'Design' => 'Conception',
    'Structure' => 'Structure',
    'Framework' => 'Framework',
    'Platform' => 'Plateforme',
    'Interface' => 'Interface',
    'Dashboard' => 'Tableau de bord'
];

// Extensions de traductions pour les patterns PHP
$phpPatterns = [
    "echo 'Dashboard'" => "echo 'Tableau de bord'",
    'echo "Dashboard"' => 'echo "Tableau de bord"',
    "return 'Dashboard'" => "return 'Tableau de bord'",
    'return "Dashboard"' => 'return "Tableau de bord"',
];

echo "=== TRADUCTION EN DUR VERS LE FRANÇAIS ===\n\n";

if (!isset($pdo) || !$pdo) {
    echo "Erreur : Impossible de se connecter à la base de données.\n";
    exit(1);
}

try {
    echo "1. MODIFICATION DE LA BASE DE DONNÉES\n";
    
    // Définir le français comme langue par défaut
    $pdo->update("UPDATE gibboni18n SET systemDefault='N'");
    $pdo->update("UPDATE gibboni18n SET systemDefault='Y', installed='Y' WHERE code='fr_FR'");
    echo "  ✓ Français défini comme langue par défaut\n";
    
    echo "\n2. TRADUCTION DES FICHIERS PHP\n";
    
    // Obtenir tous les fichiers PHP à traduire
    $directories = [
        './modules/',
        './src/',
        './',
        './themes/'
    ];
    
    $totalFiles = 0;
    $translatedFiles = 0;
    
    foreach ($directories as $dir) {
        if (!is_dir($dir)) continue;
        
        $iterator = new RecursiveIteratorIterator(
            new RecursiveDirectoryIterator($dir, RecursiveDirectoryIterator::SKIP_DOTS)
        );
        
        foreach ($iterator as $file) {
            if (!$file->isFile()) continue;
            
            $extension = strtolower($file->getExtension());
            if (!in_array($extension, ['php', 'html', 'twig'])) continue;
            
            $filepath = $file->getPathname();
            
            // Éviter certains dossiers
            if (strpos($filepath, 'vendor/') !== false ||
                strpos($filepath, 'node_modules/') !== false ||
                strpos($filepath, '.git/') !== false ||
                strpos($filepath, 'tests/') !== false) {
                continue;
            }
            
            $totalFiles++;
            
            $content = file_get_contents($filepath);
            $originalContent = $content;
            
            // Traduire les chaînes littérales
            foreach ($translations as $english => $french) {
                // Patterns pour les chaînes entre guillemets
                $patterns = [
                    "/(['\"])". preg_quote($english, '/') ."\\1/",
                    "/echo\s+['\"]". preg_quote($english, '/') ."['\"]/",
                    "/return\s+['\"]". preg_quote($english, '/') ."['\"]/",
                    "/print\s+['\"]". preg_quote($english, '/') ."['\"]/",
                    "/'value'\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/'label'\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/'name'\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/'title'\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/\"value\"\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/\"label\"\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/\"name\"\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                    "/\"title\"\s*=>\s*['\"]". preg_quote($english, '/') ."['\"]/",
                ];
                
                foreach ($patterns as $pattern) {
                    $content = preg_replace($pattern, function($matches) use ($french) {
                        return str_replace($matches[1] ?? $matches[0], $french, $matches[0]);
                    }, $content);
                }
                
                // Remplacements directs plus agressifs
                $content = str_replace("'$english'", "'$french'", $content);
                $content = str_replace("\"$english\"", "\"$french\"", $content);
                $content = str_replace(">$english<", ">$french<", $content);
                $content = str_replace("=$english&", "=$french&", $content);
            }
            
            // Sauvegarder si des changements ont été faits
            if ($content !== $originalContent) {
                file_put_contents($filepath, $content);
                $translatedFiles++;
                echo "  ✓ Traduit: " . substr($filepath, strlen('./')) . "\n";
            }
        }
    }
    
    echo "\n3. TRADUCTION DES TEMPLATES SPÉCIAUX\n";
    
    // Traduire des fichiers spécifiques importants
    $specialFiles = [
        './index.php',
        './login.php',
        './preferences.php',
        './functions.php'
    ];
    
    foreach ($specialFiles as $file) {
        if (file_exists($file)) {
            $content = file_get_contents($file);
            $originalContent = $content;
            
            // Traductions spéciales pour ces fichiers
            $specialTranslations = [
                'Welcome to Gibbon' => 'Bienvenue dans Gibbon',
                'Please log in' => 'Veuillez vous connecter',
                'Login' => 'Connexion',
                'Username' => 'Nom d\'utilisateur',
                'Password' => 'Mot de passe',
                'Forgot Password?' => 'Mot de passe oublié ?',
                'Remember Me' => 'Se souvenir de moi',
                'Log In' => 'Se connecter',
                'Dashboard' => 'Tableau de bord',
                'Administration' => 'Administration',
                'Settings' => 'Paramètres',
                'Preferences' => 'Préférences',
                'Logout' => 'Déconnexion',
                'Profile' => 'Profil',
                'Help' => 'Aide',
                'About' => 'À propos'
            ];
            
            foreach ($specialTranslations as $en => $fr) {
                $content = preg_replace("/(['\"])". preg_quote($en, '/') ."\\1/", "$1$fr$1", $content);
                $content = str_replace(">$en<", ">$fr<", $content);
            }
            
            if ($content !== $originalContent) {
                file_put_contents($file, $content);
                echo "  ✓ Traduit fichier spécial: $file\n";
            }
        }
    }
    
    echo "\n4. NETTOYAGE ET FINALISATION\n";
    
    // Vider les caches
    if (is_dir('./uploads/cache/')) {
        $files = glob('./uploads/cache/*');
        foreach($files as $file) {
            if(is_file($file)) unlink($file);
        }
        echo "  ✓ Cache vidé\n";
    }
    
    // Supprimer les sessions pour forcer une reconnexion
    $pdo->delete("DELETE FROM gibbonSession WHERE gibbonPersonID IS NULL");
    echo "  ✓ Sessions temporaires supprimées\n";
    
    echo "\n=== TRADUCTION TERMINÉE ===\n";
    echo "Fichiers analysés: $totalFiles\n";
    echo "Fichiers traduits: $translatedFiles\n";
    echo "\nActions requises:\n";
    echo "1. Déconnectez-vous de Gibbon\n";
    echo "2. Reconnectez-vous pour voir les changements\n";
    echo "3. Vérifiez que tout fonctionne correctement\n";
    echo "4. Supprimez ce script: translate_to_french_hardcoded.php\n\n";

} catch (Exception $e) {
    echo "\nErreur lors de la traduction : " . $e->getMessage() . "\n";
    echo "La traduction a été partiellement effectuée.\n";
    exit(1);
}
?>
@echo off
echo === TRADUCTION EN DUR VERS LE FRANCAIS ===
echo.

REM Sauvegarde rapide
echo Création d'une sauvegarde...
copy index.php index.php.backup 2>nul
copy functions.php functions.php.backup 2>nul
echo Sauvegarde créée.
echo.

echo Recherche de PHP...
where php.exe >nul 2>&1
if %errorlevel% == 0 (
    echo PHP trouvé. Exécution du script de traduction...
    php translate_to_french_hardcoded.php
    if %errorlevel% == 0 (
        echo.
        echo === TRADUCTION TERMINÉE AVEC SUCCÈS ===
        echo.
        echo Instructions :
        echo 1. Déconnectez-vous de Gibbon
        echo 2. Reconnectez-vous pour voir les changements
        echo 3. Vérifiez que tout fonctionne
        echo 4. Supprimez ce fichier : execute_french_translation.bat
        echo.
        pause
        exit /b 0
    ) else (
        echo Erreur lors de l'exécution du script PHP.
        echo Essai avec les modifications manuelles...
        goto manual_changes
    )
) else (
    echo PHP non trouvé. Modifications manuelles...
    goto manual_changes
)

:manual_changes
echo.
echo === MODIFICATIONS MANUELLES ===
echo.

REM Créer un script PowerShell pour les remplacements
echo $ErrorActionPreference = 'SilentlyContinue' > temp_replace.ps1
echo. >> temp_replace.ps1
echo # Fonction de remplacement >> temp_replace.ps1
echo function Replace-InFile($file, $old, $new) { >> temp_replace.ps1
echo     if (Test-Path $file) { >> temp_replace.ps1
echo         $content = Get-Content $file -Raw -Encoding UTF8 >> temp_replace.ps1
echo         if ($content -match [regex]::Escape($old)) { >> temp_replace.ps1
echo             $content = $content -replace [regex]::Escape($old), $new >> temp_replace.ps1
echo             Set-Content $file $content -Encoding UTF8 >> temp_replace.ps1
echo             Write-Host "Modifié: $file" >> temp_replace.ps1
echo         } >> temp_replace.ps1
echo     } >> temp_replace.ps1
echo } >> temp_replace.ps1
echo. >> temp_replace.ps1
echo Write-Host "Traduction des textes principaux..." >> temp_replace.ps1
echo. >> temp_replace.ps1

REM Ajouter les remplacements principaux
echo Replace-InFile "functions.php" "'Dashboard'" "'Tableau de bord'" >> temp_replace.ps1
echo Replace-InFile "functions.php" '"Dashboard"' '"Tableau de bord"' >> temp_replace.ps1
echo Replace-InFile "index.php" "'Dashboard'" "'Tableau de bord'" >> temp_replace.ps1
echo Replace-InFile "index.php" '"Dashboard"' '"Tableau de bord"' >> temp_replace.ps1

echo Replace-InFile "functions.php" "'Students'" "'Élèves'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Staff'" "'Personnel'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Parents'" "'Parents'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Activities'" "'Activités'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Attendance'" "'Présences'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Behaviour'" "'Comportement'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Markbook'" "'Carnet de notes'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Planner'" "'Planification'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Reports'" "'Rapports'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Finance'" "'Finance'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Library'" "'Bibliothèque'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Messenger'" "'Messagerie'" >> temp_replace.ps1

echo Replace-InFile "functions.php" "'Add'" "'Ajouter'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Edit'" "'Modifier'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Delete'" "'Supprimer'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'View'" "'Voir'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Search'" "'Rechercher'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Save'" "'Enregistrer'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Cancel'" "'Annuler'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Submit'" "'Soumettre'" >> temp_replace.ps1

echo Replace-InFile "functions.php" "'Login'" "'Connexion'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Logout'" "'Déconnexion'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Username'" "'Nom d\utilisateur'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Password'" "'Mot de passe'" >> temp_replace.ps1

echo Replace-InFile "functions.php" "'Yes'" "'Oui'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'No'" "'Non'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Active'" "'Actif'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'Inactive'" "'Inactif'" >> temp_replace.ps1

echo Replace-InFile "functions.php" "'School Admin'" "'Administration École'" >> temp_replace.ps1
echo Replace-InFile "functions.php" "'User Admin'" "'Administration Utilisateurs'" >> temp_replace.ps1

echo. >> temp_replace.ps1
echo Write-Host "Traduction des modules..." >> temp_replace.ps1

REM Traduction des modules principaux
for %%d in (Activities Attendance Behaviour Markbook Planner Reports Finance Library Messenger) do (
    echo Get-ChildItem "modules\%%d" -Filter "*.php" -Recurse ^| ForEach-Object { >> temp_replace.ps1
    echo     Replace-InFile $_.FullName "'Dashboard'" "'Tableau de bord'" >> temp_replace.ps1
    echo     Replace-InFile $_.FullName "'Add'" "'Ajouter'" >> temp_replace.ps1
    echo     Replace-InFile $_.FullName "'Edit'" "'Modifier'" >> temp_replace.ps1
    echo     Replace-InFile $_.FullName "'Delete'" "'Supprimer'" >> temp_replace.ps1
    echo     Replace-InFile $_.FullName "'View'" "'Voir'" >> temp_replace.ps1
    echo } >> temp_replace.ps1
)

echo. >> temp_replace.ps1
echo Write-Host "Modification terminée!" >> temp_replace.ps1
echo Write-Host "Fichiers traduits en français." >> temp_replace.ps1

echo Exécution du script PowerShell...
powershell -ExecutionPolicy Bypass -File temp_replace.ps1

echo Nettoyage...
del temp_replace.ps1 2>nul

echo.
echo === TRADUCTION MANUELLE TERMINÉE ===
echo.
echo Instructions :
echo 1. Déconnectez-vous de Gibbon
echo 2. Reconnectez-vous pour voir les changements
echo 3. Si certains textes sont encore en anglais, relancez ce script
echo 4. Supprimez ce fichier quand c'est bon : execute_french_translation.bat
echo.

pause
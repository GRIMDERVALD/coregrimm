@echo off
REM Script pour configurer la locale française sur Windows
REM À exécuter en tant qu'administrateur

echo === CONFIGURATION LOCALE FRANÇAISE WINDOWS ===
echo.

echo 1. Configuration des variables d'environnement...
setx LANG "fr_FR.UTF-8" /M
setx LC_ALL "fr_FR.UTF-8" /M
setx LANGUAGE "fr_FR.UTF-8" /M
echo Variables d'environnement définies.
echo.

echo 2. Configuration du système...
REM Configurer la locale système pour français
powershell -Command "Set-WinSystemLocale -SystemLocale fr-FR"
powershell -Command "Set-Culture -CultureInfo fr-FR"
echo Configuration système mise à jour.
echo.

echo 3. Configuration PHP (si fichier php.ini accessible)...
if exist "C:\php\php.ini" (
    echo Configuration de php.ini trouvée
    REM Ajouter les configurations nécessaires
    echo intl.default_locale = fr_FR >> "C:\php\php.ini"
    echo date.timezone = Europe/Paris >> "C:\php\php.ini"
)

if exist "C:\xampp\php\php.ini" (
    echo Configuration XAMPP trouvée
    echo intl.default_locale = fr_FR >> "C:\xampp\php\php.ini"
    echo date.timezone = Europe/Paris >> "C:\xampp\php\php.ini"
)

if exist "C:\wamp64\bin\php\php*\php.ini" (
    echo Configuration WAMP détectée - configurez manuellement php.ini
)

echo.
echo === CONFIGURATION TERMINÉE ===
echo.
echo Instructions finales :
echo 1. Redémarrez votre serveur web (Apache/IIS/Nginx)
echo 2. Redémarrez votre système si nécessaire
echo 3. Exécutez apply_french_translation.sql dans votre base
echo 4. Testez avec check_french_status.sql
echo 5. Déconnectez-vous et reconnectez-vous à Gibbon
echo.

pause
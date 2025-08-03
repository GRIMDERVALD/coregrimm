#!/bin/bash
# Script pour installer et configurer la locale française pour Gibbon
# À exécuter sur le serveur avec des droits administrateur

echo "=== INSTALLATION LOCALE FRANÇAISE POUR GIBBON ==="
echo

# 1. Installer la locale française
echo "1. Installation de la locale fr_FR.UTF-8..."

# Pour Ubuntu/Debian
if command -v apt-get &> /dev/null; then
    echo "Système Ubuntu/Debian détecté"
    sudo locale-gen fr_FR.UTF-8
    sudo update-locale
    echo "✓ Locale fr_FR.UTF-8 installée"
fi

# Pour CentOS/RHEL/Rocky Linux
if command -v yum &> /dev/null || command -v dnf &> /dev/null; then
    echo "Système CentOS/RHEL/Rocky détecté"
    if command -v dnf &> /dev/null; then
        sudo dnf install glibc-langpack-fr -y
    else
        sudo yum install glibc-langpack-fr -y
    fi
    echo "✓ Pack de langue française installé"
fi

# Pour Alpine Linux
if command -v apk &> /dev/null; then
    echo "Système Alpine détecté"
    sudo apk add musl-locales musl-locales-lang
    echo "✓ Locales installées"
fi

echo
echo "2. Vérification des locales installées..."
locale -a | grep -i fr
echo

echo "3. Configuration de l'environnement..."
# Ajouter à .bashrc ou équivalent
echo "export LC_ALL=fr_FR.UTF-8" >> ~/.bashrc
echo "export LANG=fr_FR.UTF-8" >> ~/.bashrc
echo "export LANGUAGE=fr_FR.UTF-8" >> ~/.bashrc

echo
echo "4. Test de la locale française..."
LC_ALL=fr_FR.UTF-8 date
echo

echo "=== CONFIGURATION TERMINÉE ==="
echo
echo "Instructions finales :"
echo "1. Redémarrez votre serveur web (Apache/Nginx)"
echo "2. Redémarrez PHP-FPM si utilisé"
echo "3. Exécutez ensuite apply_french_translation.sql"
echo "4. Déconnectez-vous et reconnectez-vous à Gibbon"
echo
echo "Commandes de redémarrage :"
echo "  Ubuntu/Debian : sudo systemctl restart apache2 nginx php8.1-fpm"
echo "  CentOS/RHEL   : sudo systemctl restart httpd nginx php-fpm"
echo
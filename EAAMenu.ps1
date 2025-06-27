# eaa.ps1
# Eaa Powershell pour menu 6 options
# Mon script est fait pour etre executer sur Windows Server 2022 Evalutation Edition - Vous pouvez executer cette commande IRM pour executer automatiquement: irm https://gist.githubusercontent.com/XavierMenard/2afaddd89a9b099ab120db76bc52c8b0/raw/b07e380576a6e272baf7c4fdd0507a5cc82c7db7/gistfile1.txt | iex
Clear-Host

# Boucle principale pour revenir au menu après chaque action
do {
    # Affichage du menu

    Write-Host "======================================================================================" -ForegroundColor Magenta
    Write-Host "      
     _____                                                                            _____ 
    ( ___ )                                                                          ( ___ )
     |   |~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|   | 
     |   |  __  __                    ____                            _          _ _  |   | 
     |   | |  \/  | ___ _ __  _   _  |  _ \ _____      _____ _ __ ___| |__   ___| | | |   | 
     |   | | |\/| |/ _ \ '_ \| | | | | |_) / _ \ \ /\ / / _ \ '__/ __| '_ \ / _ \ | | |   | 
     |   | | |  | |  __/ | | | |_| | |  __/ (_) \ V  V /  __/ |  \__ \ | | |  __/ | | |   | 
     |   | |_|  |_|\___|_| |_|\__,_| |_|   \___/ \_/\_/ \___|_|  |___/_| |_|\___|_|_| |   | 
     |___|~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~|___| 
    (_____)                                                                          (_____)

                        ╔═══════════════════════════════════════════╗
                        ║ ____         __  __           _           ║
                        ║| __ ) _   _  \ \/ /__ ___   _(_) ___ _ __ ║
                        ║|  _ \| | | |  \  // _` \ \ / / |/ _ \ '__| ║
                        ║| |_) | |_| |  /  \ (_| |\ V /| |  __/ |   ║
                        ║|____/ \__, | /_/\_\__,_| \_/ |_|\___|_|   ║
                        ║       |___/                               ║
                        ╚═══════════════════════════════════════════╝"
    Write-Host "                                     2025/06/20" -ForegroundColor Green 
    Write-Host "======================================================================================" -ForegroundColor Magenta
    Write-Host "Choisissez une des options suivantes"
    Write-Host "1 - Créer un utilisateur local" -ForegroundColor DarkYellow
    Write-Host "2 - Créer un groupe local" -ForegroundColor DarkYellow
    Write-Host "3 - Afficher les utilisateurs existants" -ForegroundColor DarkYellow
    Write-Host "4 - Afficher les groupes existants" -ForegroundColor DarkYellow
    Write-Host "5 - Supprimer un utilisateur" -ForegroundColor DarkYellow
    Write-Host "6 - Supprimer un groupe" -ForegroundColor DarkYellow
    Write-Host "
    0 - Quitter" -ForegroundColor Red
    Write-Host "
    ======================================================================================" -ForegroundColor Magenta

    # Demander le choix de l'utilisateur
    $choix = Read-Host "Entrez votre choix (0 à 6)"

    # Réagir selon le choix
    switch ($choix) {
        "1" {
            # Option 1 : Creation d'un utilisateur local
            $userName = Read-Host "Entrez le nom d'utilisateur à créer"
            $UserPassword = Read-Host "Entrez le mot de passe du nouveau compte" -AsSecureString
            New-LocalUser -Name $userName -FullName $userName -Password $UserPassword -Description "none"
            Write-Host "L'utilisateur '$userName' a été créé avec succès !" -ForegroundColor Green
        }
        "2" {
            # Option 2 : Creation d'un groupe local
            $groupelocal = Read-Host "Entrez le nom du groupe local à créer"
            New-LocalGroup -Name $groupelocal -Description "none"
            Write-Host "Le groupe local '$groupelocal' a été créé avec succès !" -ForegroundColor Green
        }
        "3" {
            # Option 3 : Afficher les utilisateurs existants
            $UtilisateurActif = Get-LocalUser | Where-Object { $_.Enabled -eq $true }
            $UtilisateurTrié = $UtilisateurActif | Sort-Object -Property Name -Descending
            $UtilisateurTrié | Format-Table Name, Enabled
        }
        "4" {
            # Option 4 : Afficher les groupes existants
            $GroupeLocalTrié = Get-LocalGroup | Sort-Object -Property Name -Descending
            $GroupeLocalTrié | Format-Table Name
        }
        "5" {
            # Option 5 : Supprimer un utilisateur
            $UtilisateurSupprimer = Read-Host "Entrez le nom de l'utilisateur à supprimer"
            $confirmation = Read-Host "Êtes-vous certain de vouloir supprimer l'utilisateur '$UtilisateurSupprimer' ? (Oui/Non)"
            if ($confirmation -eq "Oui" -or $confirmation -eq "oui") {
                Remove-LocalUser -Name $UtilisateurSupprimer
                Write-Host "L'utilisateur '$UtilisateurSupprimer' a été supprimé avec succès !" -ForegroundColor Green
            }
        }
        "6" {
            # Option 6 : Supprimer un groupe
            $GroupeSupprimer = Read-Host "Entrez le nom du groupe à supprimer"
            $confirmation = Read-Host "Êtes-vous certain de vouloir supprimer le groupe '$GroupeSupprimer' ? (Oui/Non)"
            if ($confirmation -eq "Oui" -or $confirmation -eq "oui") {
                Remove-LocalGroup -Name $GroupeSupprimer
                Write-Host "Le groupe '$GroupeSupprimer' a été supprimé avec succès !" -ForegroundColor Green
            }
        }
        "0" {
            Write-Host "Au revoir!" -ForegroundColor Cyan
            break # Sortie de la boucle et fin du script
        }
        default {
            Write-Host "Option invalide, veuillez entrer un numéro valide entre 0 et 6." -ForegroundColor Red
        }
    }

} while ($choix -ne "0")  # Revenir au menu sauf "0" 
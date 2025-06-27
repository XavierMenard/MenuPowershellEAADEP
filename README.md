# 🎮 **Eaa PowerShell Script** - Gestion des utilisateurs et groupes locaux

Ce script PowerShell vous permet de gérer facilement des utilisateurs et des groupes locaux sur un système **Windows Server 2022** (ou une version compatible). Il présente un menu interactif pour créer, afficher et supprimer des utilisateurs et des groupes locaux sur votre serveur.

## 🛠️ Prérequis

- **Système d'exploitation** : Windows Server 2022 Édition d'Évaluation ou toute version compatible.
- **PowerShell** : Version 5.1 ou supérieure.
- **Permissions** : Droits administratifs pour exécuter les commandes sur les utilisateurs et groupes locaux.

## 🚀 Installation

### Exécution locale :

1. **Téléchargez le fichier `eaa.ps1`**.
2. **Ouvrez PowerShell en tant qu'administrateur**.
3. **Si nécessaire, modifiez la politique d'exécution pour permettre l'exécution de scripts** :

   ```powershell
   Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Ensuite, exécutez le script localement :

powershell
Copier
Modifier
.\eaa.ps1
📜 Fonctionnalités
Le script présente un menu interactif avec les options suivantes :

Option	Action
1 - Créer un utilisateur local	Crée un nouvel utilisateur local avec un nom et un mot de passe.
2 - Créer un groupe local	Crée un groupe local sur le système.
3 - Afficher les utilisateurs existants	Liste tous les utilisateurs locaux actifs.
4 - Afficher les groupes existants	Liste tous les groupes locaux présents sur le système.
5 - Supprimer un utilisateur	Supprime un utilisateur local après confirmation.
6 - Supprimer un groupe	Supprime un groupe local après confirmation.
0 - Quitter	Ferme le script.

Exemple d'interface utilisateur :
perl
Copier
Modifier
======================================================================================
      
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
                        ╚═══════════════════════════════════════════╝

Choisissez une des options suivantes :
1 - Créer un utilisateur local
2 - Créer un groupe local
3 - Afficher les utilisateurs existants
4 - Afficher les groupes existants
5 - Supprimer un utilisateur
6 - Supprimer un groupe

0 - Quitter
⚙️ Détails des options
1. Créer un utilisateur local
Demande	Action
Nom d'utilisateur et mot de passe	Crée l'utilisateur avec le mot de passe fourni.

powershell
Copier
Modifier
New-LocalUser -Name $userName -FullName $userName -Password $UserPassword -Description "none"
2. Créer un groupe local
Demande	Action
Nom du groupe à créer	Crée le groupe local sur le système.

powershell
Copier
Modifier
New-LocalGroup -Name $groupelocal -Description "none"
3. Afficher les utilisateurs existants
Action
Affiche tous les utilisateurs locaux actifs.

powershell
Copier
Modifier
Get-LocalUser | Where-Object { $_.Enabled -eq $true } | Sort-Object -Property Name -Descending | Format-Table Name, Enabled
4. Afficher les groupes existants
Action
Affiche tous les groupes locaux existants.

powershell
Copier
Modifier
Get-LocalGroup | Sort-Object -Property Name -Descending | Format-Table Name
5. Supprimer un utilisateur
Demande	Action
Nom de l'utilisateur à supprimer et confirmation avant suppression	Supprime l'utilisateur local choisi.

powershell
Copier
Modifier
Remove-LocalUser -Name $UtilisateurSupprimer
6. Supprimer un groupe
Demande	Action
Nom du groupe à supprimer et confirmation avant suppression	Supprime le groupe local choisi.

powershell
Copier
Modifier
Remove-LocalGroup -Name $GroupeSupprimer
7. Quitter
Action
Quitte le script.

powershell
Copier
Modifier
break
📝 Exemple d'exécution
Lorsque vous lancez le script, le menu apparaît et vous invite à choisir une option. Voici un exemple de ce à quoi cela pourrait ressembler dans votre terminal :

perl
Copier
Modifier
======================================================================================
      
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
                        ╚═══════════════════════════════════════════╝

Choisissez une des options suivantes :
1 - Créer un utilisateur local
2 - Créer un groupe local
3 - Afficher les utilisateurs existants
4 - Afficher les groupes existants
5 - Supprimer un utilisateur
6 - Supprimer un groupe

0 - Quitter
🛠️ Commandes PowerShell utilisées
Commande	Description
New-LocalUser	Crée un utilisateur local.
New-LocalGroup	Crée un groupe local.
Get-LocalUser	Récupère la liste des utilisateurs locaux.
Get-LocalGroup	Récupère la liste des groupes locaux.
Remove-LocalUser	Supprime un utilisateur local.
Remove-LocalGroup	Supprime un groupe local.

⚠️ Problèmes fréquents
Si vous avez des problèmes avec l'exécution de ce script, vérifiez que votre politique d'exécution autorise l'exécution de scripts :

powershell
Copier
Modifier
Get-ExecutionPolicy
Si elle est définie sur Restricted, vous pouvez modifier la politique comme suit :

powershell
Copier
Modifier
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
🤝 Contribuer
Vous êtes bienvenu pour contribuer à ce projet ! Si vous souhaitez ajouter de nouvelles fonctionnalités ou améliorer le code, suivez ces étapes :

Forkez ce dépôt.

Créez une nouvelle branche pour vos modifications (git checkout -b feature/nom-fonctionnalite).

Apportez vos changements et commitez les (git commit -am 'Ajout de nouvelle fonctionnalité').

Poussez la branche (git push origin feature/nom-fonctionnalite).

Ouvrez une Pull Request pour soumettre vos modifications.

📄 Licence
Ce script est sous la licence MIT.

Merci d'utiliser ce script ! Si vous avez des questions ou des suggestions, n'hésitez pas à ouvrir un Issue sur GitHub.

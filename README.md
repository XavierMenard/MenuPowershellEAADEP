Eaa PowerShell Script Documentation
Description
Ce script PowerShell (eaa.ps1) permet de gérer des utilisateurs et des groupes locaux sur un système Windows Server 2022 Édition d'Évaluation. Il offre un menu interactif en ligne de commande permettant de :

Créer des utilisateurs locaux.

Créer des groupes locaux.

Afficher les utilisateurs et les groupes existants.

Supprimer des utilisateurs et des groupes.

Le script est conçu pour être exécuté de manière simple et rapide sur un serveur Windows via PowerShell.

Prérequis
Système d'exploitation : Windows Server 2022 Édition d'Évaluation ou une version compatible.

PowerShell : Le script doit être exécuté à l'aide de PowerShell (version 5.1 ou supérieure).

Permissions : L'utilisateur doit disposer des droits administratifs pour gérer des utilisateurs et des groupes locaux.

Installation
Ouvrez une fenêtre PowerShell en tant qu'administrateur.

Exécutez la commande suivante pour télécharger et exécuter le script automatiquement depuis un fichier distant via Invoke-RestMethod (IRM) :

powershell
Copier
Modifier
irm https://gist.githubusercontent.com/XavierMenard/2afaddd89a9b099ab120db76bc52c8b0/raw/b07e380576a6e272baf7c4fdd0507a5cc82c7db7/gistfile1.txt | iex
Alternativement, vous pouvez télécharger le fichier .ps1 directement et l'exécuter localement :

powershell
Copier
Modifier
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
.\eaa.ps1
Usage
Une fois le script lancé, vous verrez un menu interactif avec 6 options principales :

Créer un utilisateur local : Crée un nouvel utilisateur local avec un nom et un mot de passe définis par l'utilisateur.

Créer un groupe local : Crée un nouveau groupe local sur le système.

Afficher les utilisateurs existants : Liste tous les utilisateurs locaux actuellement activés sur le système.

Afficher les groupes existants : Liste tous les groupes locaux présents sur le système.

Supprimer un utilisateur : Permet de supprimer un utilisateur local en demandant une confirmation.

Supprimer un groupe : Permet de supprimer un groupe local en demandant une confirmation.

Quitter : Quitte le script.

Exemple d'utilisation
Lancez le script et choisissez une option via l'interface en ligne de commande.

bash
Copier
Modifier
Choisissez une des options suivantes :
1 - Créer un utilisateur local
2 - Créer un groupe local
3 - Afficher les utilisateurs existants
4 - Afficher les groupes existants
5 - Supprimer un utilisateur
6 - Supprimer un groupe

0 - Quitter
Détails des Options
1. Créer un utilisateur local
Demande le nom d'utilisateur et le mot de passe.

Crée l'utilisateur avec un mot de passe sécurisé.

2. Créer un groupe local
Demande le nom du groupe à créer et le crée.

3. Afficher les utilisateurs existants
Affiche une liste des utilisateurs locaux actifs.

4. Afficher les groupes existants
Affiche une liste des groupes locaux présents sur la machine.

5. Supprimer un utilisateur
Demande le nom d'utilisateur à supprimer.

Une confirmation est demandée avant de supprimer l'utilisateur.

6. Supprimer un groupe
Demande le nom du groupe à supprimer.

Une confirmation est demandée avant de supprimer le groupe.

Commandes PowerShell utilisées
Voici quelques-unes des commandes PowerShell utilisées dans ce script :

New-LocalUser : Crée un utilisateur local.

New-LocalGroup : Crée un groupe local.

Get-LocalUser : Récupère la liste des utilisateurs locaux.

Get-LocalGroup : Récupère la liste des groupes locaux.

Remove-LocalUser : Supprime un utilisateur local.

Remove-LocalGroup : Supprime un groupe local.

Aide
En cas de problème, vous pouvez vérifier que votre exécution de script PowerShell est activée en exécutant :

powershell
Copier
Modifier
Get-ExecutionPolicy
Si elle est définie sur Restricted, vous pouvez la modifier avec la commande suivante (nécessite des privilèges administratifs) :

powershell
Copier
Modifier
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Contribuer
Si vous souhaitez contribuer à ce projet, vous pouvez :

Forker ce dépôt.

Créer une branche pour vos modifications (git checkout -b feature-nouvelle-fonction).

Effectuer vos changements, puis committer avec des messages clairs.

Soumettre une pull request pour intégrer vos modifications.

Licence
Ce script est mis à disposition sous la licence MIT.


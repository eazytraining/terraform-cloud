TP1 - Installation de Terraform

Téléchargez le programme d'installation Terraform depuis le site web officiel [suivant](https://www.terraform.io/downloads.html).

Sélectionnez la version appropriée pour Windows (32 bits ou 64 bits) et cliquez sur le lien de téléchargement.

Une fois le téléchargement terminé, extraire le fichier .exe

creer un repertoire au niveau de votre disque : Dans mon cas C:\Terraform
Copier le fichier.exe a l'interieur
Ouvrir la panel de gestion des variables d'environnement du systeme : 
    - Appuyer sur le bouton windows
    - Tapez env
    - choisir edit the system environment variables
    - cliquer sur environment variables
    - choisir Path dans system variables 
    - cliquer sur edit
    - cliquer sur browse (choisir le repertoire ou le fichier .exe a ete extrait : C:\Terraform )
    - cliquer sur OK puis OK puis OK



Si vous êtes sous linux, vous pouvez déplacer le bianire dans `/usr/bin/` après l’avoir rendu executable

verifier que terraform est present sur le system en utilisant la commande suivante:
``` bash
terraform --version
```


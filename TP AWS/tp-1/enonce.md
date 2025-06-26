🧪 TP1 – Installation de Terraform
🔽 1. Télécharger Terraform
Rendez-vous sur le site officiel de Terraform :
👉 https://www.terraform.io/downloads.html

Choisissez la version correspondant à votre système d'exploitation (Windows 32 bits ou 64 bits).

Cliquez sur le lien pour télécharger l’archive contenant l’exécutable.

📂 2. Extraction et placement de l’exécutable
Une fois le téléchargement terminé, extrayez l’archive ZIP pour obtenir le fichier terraform.exe.

Créez un dossier dédié sur votre disque, par exemple : C:\Terraform.

Déplacez le fichier terraform.exe dans ce dossier.

⚙️ 3. Ajouter Terraform au PATH (sous Windows)
Appuyez sur la touche Windows, tapez env, puis sélectionnez "Modifier les variables d’environnement système".

Cliquez sur "Variables d’environnement".

Dans la section Variables système, sélectionnez la variable Path, puis cliquez sur Modifier.

Cliquez sur Parcourir et ajoutez le dossier C:\Terraform.

Validez en cliquant sur OK, puis encore OK pour fermer les fenêtres.

🐧 4. Installation sous Linux
Si vous êtes sous Linux :

```bash
chmod +x terraform
sudo mv terraform /usr/bin/
```
✅ 5. Vérification de l’installation
Dans un terminal ou une invite de commande, exécutez :

```bash
terraform --version
```

Vous devriez voir la version installée de Terraform s’afficher.
## tp-2 : deployez vos ressources


Créer des clés d'accès (access key et secret key) :

- Connectez-vous à la console AWS.
- Cliquez sur votre nom d'utilisateur en haut à droite, puis sélectionnez "Mes informations de sécurité".
- Sous "Clés d'accès (ID de clé d'accès et clé d'accès secrète)", cliquez sur "Créer une nouvelle clé d'accès".
- Choisissez "Générer une nouvelle paire de clés" et cliquez sur "Suivant".
- Téléchargez le fichier CSV contenant l'ID de clé d'accès et la clé d'accès secrète.
Assurez-vous de sauvegarder et de sécuriser ces informations, car la clé d'accès secrète ne sera plus accessible après cette étape.

Créer une paire de clés :

- Connectez-vous à la console AWS (https://console.aws.amazon.com/).
- Allez dans le service "EC2" (services > Compute > EC2).
- Dans le panneau de navigation de gauche, cliquez sur "Paires de clés".
- Cliquez sur "Créer une paire de clés".
- Donnez un nom à votre paire de clés et sélectionnez le format de fichier (par exemple ".pem" pour Linux/macOS ou ".ppk" pour Windows).
- Cliquez sur "Créer une paire de clés". Votre navigateur téléchargera le fichier de la clé privée.
- Récupérer une paire de clés existante :

Suivez les étapes 1 à 3 ci-dessus.
Sélectionnez la paire de clés que vous voulez récupérer.
Cliquez sur "Actions" > "Exporter la clé privée".
Entrez le mot de passe pour télécharger le fichier de la clé privée.

- Initialisez la configuration de Terraform.

  La première commande à exécuter après l'écriture d'une nouvelle configuration Terraform est la commande`terraform init` permettant d'initialiser un répertoire de travail contenant les fichiers de configuration Terraform. Il est prudent d'exécuter cette commande plusieurs fois.

  Si vous définissez ou modifiez des modules ou la configuration du backend pour Terraform, réexécutez cette commande pour réinitialiser votre répertoire de travail. Si vous oubliez, d'autres commandes le détecteront et vous rappelleront de le faire si nécessaire.

  Exécutez la commande :

  ```
  terraform init
  ```

- Validez les modifications.

  La commande  `terraform plan` vous permet de voir ce que Terraform fera avant d'apporter des modifications.

  Exécutez la commande :

  ```
  terraform plan
  ```

  

- Appliquez les modifications.

  La commande `terraform apply` vous permet d'appliquer votre configuration et de créer l'infrastructure.

  Exécutez la commande :

  ```
  terraform apply
  ```

  Testez les changements.

  Une fois la commande `terraform apply` terminée, utilisez la console Azure, vous devriez voir la nouvelle machine virtuelle créée.

- Nettoyer les ressources créées.

  Lorsque vous avez terminé, la commande `terraform destroy` détruit l'infrastructure que vous avez créée.

  Exécutez la commande :

  ```shell
  terraform destroy
  ```


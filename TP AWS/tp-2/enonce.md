# TP-2 : Déployez vos ressources

## Création des clés d'accès AWS

Pour créer des clés d'accès (Access Key et Secret Key) :

1. Connectez-vous à la [console AWS](https://console.aws.amazon.com/)
2. Cliquez sur votre nom d'utilisateur (en haut à droite)
3. Sélectionnez "Mes informations de sécurité"
4. Dans la section "Clés d'accès", cliquez sur "Créer une nouvelle clé d'accès"
5. Choisissez "Générer une nouvelle paire de clés"
6. Cliquez sur "Suivant"
7. Téléchargez le fichier CSV contenant les informations

**Important** : Sauvegardez et sécurisez ces informations. La clé secrète ne sera plus accessible après cette étape.

## Gestion des paires de clés EC2

### Créer une nouvelle paire de clés

1. Connectez-vous à la [console AWS EC2](https://console.aws.amazon.com/ec2/)
2. Dans le menu de gauche, cliquez sur "Paires de clés"
3. Cliquez sur "Créer une paire de clés"
4. Attribuez un nom à votre paire de clés
5. Sélectionnez le format :
   - `.pem` pour Linux/macOS
   - `.ppk` pour Windows
6. Cliquez sur "Créer une paire de clés"
7. Le fichier de clé privée sera téléchargé automatiquement

### Récupérer une paire de clés existante

1. Suivez les étapes 1-3 ci-dessus
2. Sélectionnez la paire de clés souhaitée
3. Cliquez sur "Actions" > "Exporter la clé privée"
4. Entrez un mot de passe pour sécuriser le téléchargement

## Configuration Terraform

### Initialisation

La première commande à exécuter après avoir écrit une configuration Terraform :

```bash
terraform init
```
Note : Cette commande peut être exécutée plusieurs fois. Elle est nécessaire après toute modification des modules ou de la configuration backend.

### Validation des modifications
Pour prévisualiser les changements avant application :

```bash
terraform plan
```
### Application des modifications
Pour déployer l'infrastructure :

``` bash
terraform apply
```

Vérification : Après l'exécution, vérifiez dans la console AWS que vos ressources ont bien été créées.

### Nettoyage des ressources
Pour détruire l'infrastructure créée :

```bash
terraform destroy
```
Attention : Cette action est irréversible et supprimera toutes les ressources gérées par cette configuration Terraform.
# Configuration de Terraform Cloud

## 1. Configuration des Variables d'Environnement

### Étapes pour créer un Variable Set :

1. **Connexion**  
   Accédez à [Terraform Cloud](https://app.terraform.io) et authentifiez-vous

2. **Navigation**  
Votre Organisation → Settings → Variable Sets → Create variable set

3. **Configuration du set**  
- **Nom** : Donnez un nom explicite (ex: `aws-global-credentials`)
- **Description** : Ajoutez une note descriptive
- **Scope** : Définissez la portée d'application

4. **Ajout des variables AWS**  
Pour chaque variable :
- Cliquez `Add variable`
- Remplissez :
  ```
  Key: AWS_ACCESS_KEY_ID
  Value: [votre-access-key]
  ```
  ```
  Key: AWS_SECRET_ACCESS_KEY  
  Value: [votre-secret-key]
  ```
- Type : Sélectionnez `Environment Variable`
- ⚠️ Cochez `Sensitive` pour les deux

5. **Finalisation**  
`Add Variable` → `Create variable set`

## 2. Connexion CLI à Terraform Cloud

```bash
terraform login
```
Processus d'authentification :
Confirmez avec yes dans le terminal

Vous serez redirigé vers l'interface web pour :

Remplir la description du token (ex: "poste-dev-2024")

Définir la durée de validité

Cliquer Generate token

Récupération du token

Utilisez le bouton Copy à côté du token généré

Collez-le dans votre terminal en attente

Validation
Un message de confirmation apparaîtra en cas de succès.

Important :

Les tokens ont une durée limitée

Ne jamais commit de tokens dans le code

Régénérez périodiquement vos credentials
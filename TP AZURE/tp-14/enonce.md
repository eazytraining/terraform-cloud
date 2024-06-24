- Connectez-vous à votre compte Terraform Cloud sur le site web officiel.

pour creer des variables sets
- choissiser votre organisation > settings > variable sets > create variable sets
    - entrer un nom
    - une description
    - choisir le champ d'action de la variable
    - puis cliquer sur Add variable

une fois a ce niveau il faut entrer le nom de la variable et la valeur de cette variable
pour le cas des cles d'acces alors il faut utiliser:
    - ARM_CLIENT_ID = This is the Application (client) ID of the Service Principal
    - ARM_CLIENT_SECRET = This is the secret password for the Service Principal
    - ARM_TENANT_ID = This is the Directory (tenant) ID of the Service Principal
    - ARM_SUBSCRIPTION_ID = The ID of the Subscription where resources will be created

une fois les valeurs rajouter il faut choisir Environment Variable et cocher la case sentive puis cliquer sur Add Variable > Create variable set


Connexion a terraform cloud via la CLI:

```bash
terraform login
```
- Répondez par yes pour confirmer la connection
- Vous allez être dirigé vers la page de création de token sur terraform cloud. Remplissez la description de votre token, la durée d'expiration et - cliquez sur Generate token 

- Le token créé s'affiche, vous allez le copier en cliquant sur le bouton Copy qui se trouve à droite du token

- Coller le token créé sur votre CLI où vous avez initié le terraform login
- Si vous avez procédé convenablement vous aurez ce message de bienvenu à Terraform Cloud 
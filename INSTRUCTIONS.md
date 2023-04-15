# Instructions

Ici vous trouverez les instructions pour l'installation et l'utilisation de notre projet.

## Prérequis

* [Pharo](https://pharo.org/download)

## Exemple cochange

[voir le fichier README.md dans le dossier cochange](cochange/README.md)

## Example d'analyse des projets

[voir le fichier README.md dans le dossier scripts](scripts/README.md)

## Example d'analyse d'un projet

Tout d'abord, vous devez cloner un projet, par exemple le projet Emojiopoly. Il est conseillé de le faire à l'intérieur d'un dossier, ex : Github :

* `mkdir Github && cd Github`
* `git clone https://github.com/Chuzzy/Emojiopoly`

Ensuite, en suivant le tutoriel typescript de pharo, installez Famix :

* `git clone https://github.com/Arezoo-Nasr/FamixTypeScriptImporter`

* `cd FamixTypeScriptImporter`

* `npm install`

* `npm install -g ts-node`

 et générer le fichier .json de notre projet :

* `ts-node src/ts2famix-cli.ts -i "../Emojiopoly/**/*.ts" -o emojiopoly-model.json`

### Charger le métamodèle FamixTypeScript dans Moose :

Par défaut, Moose n’a pas de métamodèle pour le langage TypeScript. Alors, il faut charger le métamodèle FamixTypeScript dans Moose et régénérer ce métamodèle.

### Charger avec un script Baseline

- Sélectionner l’image *Moose Suite 10 (development) (créée à l’étape précédente) dans Pharo Launcher et la démarrer (bouton Launch)

- Dans Pharo, taper CTRL-O CTRL-W pour ouvrir une fenêtre Moose Playground.

- Dans cette fenêtre, taper (coller) le texte suivant :

    ```
    Metacello new 
        githubUser: 'Arezoo-Nasr' project: 'FamixTypeScript' commitish: 'master' path: 'src';
        baseline: 'FamixTypeScript';
        load
    ```

- Taper CTRL-SHIFT-G (Do it all and go) pour exécuter la commande. Le métamodèle devrait être chargé à la fin.

- Menu Library > Famix > Manage metamodels > Regenerate all metamodels

Apres dans l'image on peut cloner cette projet avec iceberg:

![image](https://user-images.githubusercontent.com/10481058/231510555-3e785324-446b-478d-9f41-55f0e969a622.png)

On doit aussi charger le projet dans l'image:

![image](https://user-images.githubusercontent.com/10481058/232180728-12b9b57d-bc28-45a1-8892-d8eea4cc6aa5.png)

On doit aussi également déplacer le fichier .json généré par ts-2-famix dans un dossier à l'intérieur de l'image. Nous avons créé un exemple de dossier appelé 'models' dans le dossier 'images' de l'image. (Exemple: C:\Users\Charles\Documents\Pharo\images\models)

### Pour lancer l'analyse du projet

Finalement copier le code suivant dans un playground et lancer l'exécution:
* *Note*: l'image de test ne doit pas avoir la mise à jour des renommage de Moose de fin mars. 

```
|ListOfModel|.

"Reset all Model"
MooseModel resetRoot. 

"Get all the models"
directory := 'C:\Users\Charles\Documents\Pharo\images\models test fanIN_exemple prof\Model' asFileReference .
models := directory allChildren select: [ :each | each basename endsWith: '.json' ].

"Import all the models"
models do: [ :each | each asFileReference readStreamDo:
    [ :stream | model := FamixTypeScriptModel new 
      importFromJSONStream: stream. model install ]. ].

"extract moose property and export in a CSV"
ListOfModel := MooseModel root.
ListOfModel do: [ :each |scan:= ProjectScan new. scan tsModel: each. scan run. ].

```

Cette commande va générer un fichier CSV dans le dossier 'images' de l'image (Exemple: C:\Users\Charles\Documents\Pharo\images) pour chaque modèle importé.

* *Note*: le chemin du dossier doit être modifié en fonction de votre image Pharo et de votre projet. Ce chemin doit être le chemin du dossier contenant le fichier .json généré par ts-2-famix.

* *Exemple*: C:\Users\Charles\Documents\Pharo\images\models test fanIN_exemple prof\Model
* *Exemple Ubuntu*: /home/brunomoya/Pharo/images/Moose Suite 10 (development)/models

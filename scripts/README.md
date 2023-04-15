# Projet MGL843 - 

## Description

## Etapes

### 1. Installation de ts2famix

```bash

git clone https://github.com/Arezoo-Nasr/FamixTypeScriptImporter.git

cd FamixTypeScriptImporter

npm install

npm install -g ts-node

```

### 2. Selection, téléchargement et génération des modèles

Pour réaliser cette étape nous avons réalisé une suite de script:

- `repos.sh` : permet, via l'API de github, de récupérer les 100 premiers projets typescript les plus populaires a ayant une taille inferieure à 5Mo, cette liste est enregistrée dans le fichier `repos.json`.
- `download.sh` : permet de télécharger les projets typescript récupérés par `repos.sh`.
- `model.sh` : permet de générer les modèles famix des projets typescript téléchargés par `download.sh`.
- `analyse.sh` : permet de générer un fichier json indiquand dans chaque projet combien de Union Type sont présents.
- `select.sh` : permet de sélectionner aléatoirement des projets typescript.
- `move.sh` : permet de déplacer les projets typescript sélectionnés dans un dossier de l'image Pharo.
  
```bash

./repos.sh

./download.sh

./model.sh

./analyse.sh

./select.sh

./move.sh


```

## Notes

Ces script sont consus pour être exécutés sur un système linux.
Lors de la génération de modèles famix, il arrive que certains modèles ne soient pas généras correctement, de ce fait il n'est pas possible de les charger dans Pharo.
Pour pouvoir avoir accès au code source des projet lors de l'analyse dans Pharo il faut impérativement lancer le script `model.sh` un l'interpréteur `git bash` sous windows.

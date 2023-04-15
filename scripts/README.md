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

model.sh script va aussi intenter d'installer ts2famix, mais il est possible que cela ne fonctionne pas. Dans ce cas, il faut installer ts2famix manuellement.

### 2. Selection, téléchargement et génération des modèles

Pour réaliser cette étape nous avons réalisé une suite de script:

- `repos.sh` : permet, via l'API de github, de récupérer les 100 premiers projets typescript les plus populaires a ayant une taille inferieure à 5Mo, cette liste est enregistrée dans le fichier `repos.json`.
- `download.sh` : permet de télécharger les projets typescript récupérés par `repos.sh`.
- `model.sh` : permet de générer les modèles famix des projets typescript téléchargés par `download.sh`.
- `analyse.sh` : permet de générer un fichier json indiquand dans chaque projet combien de Union Type sont présents.
- `select.sh` : permet de sélectionner aléatoirement des projets typescript.
- `move.sh` : permet de déplacer les projets typescript sélectionnés dans un dossier de l'image Pharo.
  
Premièrement, il faut exécuter le script python `repos.py` pour récupérer les projets typescript et les enregistrer dans le fichier `repos.json`. Ce script va générer un fichier JSON contenant les 100 premiers dépôts du langage TypeScript dont la taille est inférieure à 5 Mo.

Après avoir exécuté le script `repos.py`, il faut exécuter le script `download.sh` pour télécharger les projets typescript. Après avoir téléchargé les projets typescript, il faut exécuter le script `model.sh` pour générer les modèles famix et analyse.sh pour générer le fichier indiquant le nombre de Union Type dans chaque projet.

Finallement, il faut exécuter le script `selection.py` pour sélectionner aléatoirement des projets typescript. Enfin, il faut exécuter le script `move.sh` pour déplacer les projets typescript sélectionnés dans un dossier de l'image Pharo.

```bash

1. python repos.py

2. ./download.sh

3. ./model.sh

4. ./analyse.sh

5. python selection.py

6. ./move.sh

```

Il est possible de lancer tout les scripts en même temps avec les valeurs par défaut en exécutant le script `run_all.sh`.

Mais, c'est meilleur de lancer les scripts un par un pour pouvoir voir les résultats intermédiaires.

* *Astuce* : Si vous lancez le script 'run_all.sh' ou 'models.sh' avec --multi vous pouvez lancer la génération des modèles famix en parallèle. Cela peut être utile si vous avez un ordinateur avec plusieurs coeurs. Par contre, il faut faire attention à ne pas surcharger votre ordinateur.


### Pour lancer l'analyse des projets

[voir la section Pour lancer l'analyse du projet](https://github.com/elblogbruno/MGL843-04/blob/master/INSTRUCTIONS.md#pour-lancer-lanalyse-du-projet)


## Notes

Ces script sont consus pour être exécutés sur un système linux.
Lors de la génération de modèles famix, il arrive que certains modèles ne soient pas généras correctement, de ce fait il n'est pas possible de les charger dans Pharo.
Pour pouvoir avoir accès au code source des projet lors de l'analyse dans Pharo il faut impérativement lancer le script `model.sh` un l'interpréteur `git bash` sous windows.

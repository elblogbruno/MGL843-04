# MGL843-04
Code pour notre projet pour le cours MGL843. 
Dans ce projet, nous voulions démontrer empiriquement que nous pouvons avoir un bénéfice ou une différence dans la qualité de notre code en passant de l'utilisation des Classes en typescript, pour commencer à utiliser les types Union.

### Directory Organization

- src
    - CSVExport
    - MGL843

### Instruction

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

Apres dans une image Pharo Moose Suite 10 (development) on peut cloner cette projet avec iceberg:

![image](https://user-images.githubusercontent.com/10481058/231510555-3e785324-446b-478d-9f41-55f0e969a622.png)

et copier le code suivant dans un playground et lancer l'exécution.
* *Note*: l'image de test ne doit pas avoir la mise à jour des renommage de Moose de fin mars. 

```
|ListOfModel|.

"Reset all Model"
MooseModel resetRoot. 

"Get all the models"
directory := 'C:\Users\Charles\Documents\Pharo\images\Emojiopoly test fanIN_exemple prof\Model' asFileReference .
models := directory allChildren select: [ :each | each basename endsWith: '.json' ].
"Import all the models"
models do: [ :each | each asFileReference readStreamDo:
    [ :stream | model := FamixTypeScriptModel new 
      importFromJSONStream: stream. model install ]. ].

"extract moose property and export in a CSV"
ListOfModel := MooseModel root.
ListOfModel do: [ :each |scan:= ProjectScan new. scan tsModel: each. scan run. ].

```

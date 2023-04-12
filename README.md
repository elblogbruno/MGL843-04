# MGL843-04
Code pour notre projet pour le cours MGL843. 
Dans ce projet, nous voulions démontrer empiriquement que nous pouvons avoir un bénéfice ou une différence dans la qualité de notre code en passant de l'utilisation des Classes en typescript, pour commencer à utiliser les types Union.

### Directory Organization

- src
    - CSVExport
    - MGL843

### Instruction

dans une image Pharo Moose Suite 10 (development), copier le code suivant dans un playground. Lancer l'exécution
Note: l'image de test ne doit pas avoir la mise à jour des renommage de Moose de fin mars.

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

## Acknowledgements

 - [Awesome Readme Templates](https://awesomeopensource.com/project/elangosundar/awesome-README-templates)
 - [Awesome README](https://github.com/matiassingers/awesome-readme)
 - [How to write a Good readme](https://bulldogjob.com/news/449-how-to-write-a-good-readme-for-your-github-project)


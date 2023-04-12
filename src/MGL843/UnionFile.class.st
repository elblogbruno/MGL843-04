"
Files with union scan
"
Class {
	#name : #UnionFile,
	#superclass : #Object,
	#instVars : [
		'tsUnionModels'
	],
	#category : #MGL843
}

{ #category : #running }
UnionFile >> UnionRun [
	"Get all the models"
| fileList unionClasses |
tsUnionModels := MooseModel root allModels.
fileList := OrderedCollection new.

tsUnionModels do: [ :tsModel |
    "Find all classes containing a Union"     
    unionClasses := tsModel allTypes 
        select: [ :each | each name includesSubstring: '|' ].


    "Find all files containing a Union"
    unionClasses do: [ :eachClass | 
        (eachClass typedEntities select: [ :eachEntity | eachEntity isNotNil ]) 
            collect: [ :eachEntity | 
                | fileName |
                fileName := eachEntity value sourceAnchor fileName.
                fileList add: fileName ] ].
].

String streamContents: [ :writeStream |
	(NeoCSVWriter on: writeStream)
		writeHeader: #(id filename);
		nextPutAll: fileList  ].
	
	'unionfile.csv' asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: #(id filename);
			nextPutAll: fileList ].

fileList inspect.
]

{ #category : #accessing }
UnionFile >> tsUnionModels: anOrderedCollection [
		tsUnionModels:= anOrderedCollection 
]

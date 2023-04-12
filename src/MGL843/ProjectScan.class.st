"
Metrics scan pour les projets
"
Class {
	#name : #ProjectScan,
	#superclass : #Object,
	#instVars : [
		'tsModel'
	],
	#category : #MGL843
}

{ #category : #running }
ProjectScan >> run [
	"Get the emojiopoly model (first in Moose panel)"
| fanINClass data metrics projectname |
"tsModel := MooseModel root last."
projectname := tsModel name, '.csv'.
"Find all classes that have FanIN value"
fanINClass  := tsModel allModelClasses 
    "select: [ :each | 
        each fanIn > 0 ]".
data:= OrderedCollection new.

data:= fanINClass collect:[:each|metrics:= Metrics new. 	metrics name: each name. metrics fanin: each fanIn. metrics fanout: each fanOut. metrics lcom2: each lcom2 asFloat. metrics lcom3: each lcom3 asFloat. metrics numberOfAttributes: each numberOfAttributes. metrics numberOfLinesOfCode: each numberOfLinesOfCode. metrics numberOfMethods: each numberOfMethods. metrics].
	
String streamContents: [ :writeStream |
	(NeoCSVWriter on: writeStream)
		writeHeader: #( 'ClassName' 'fanIN'  'fanOut'  'lcom2' 'lcom3' 'numberOfAttributes' 'numberOfLinesOfCode' 'numberOfMethods');
		addFields: #(name fanin  fanout  lcom2 lcom3 numberOfAttributes numberOfLinesOfCode numberOfMethods);
		nextPutAll: data ].


projectname asFileReference
	writeStreamDo: [ :writeStream |
		(NeoCSVWriter on: writeStream)
 			writeHeader: #( 'ClassName' 'fanIN'  'fanOut'  'lcom2' 'lcom3' 'numberOfAttributes' 'numberOfLinesOfCode' 'numberOfMethods' );
			addFields: #(name fanin  fanout  lcom2 lcom3 numberOfAttributes numberOfLinesOfCode numberOfMethods);
			nextPutAll: data ]

]

{ #category : #accessing }
ProjectScan >> tsModel: anOrderedCollection [
		tsModel:= anOrderedCollection 
]

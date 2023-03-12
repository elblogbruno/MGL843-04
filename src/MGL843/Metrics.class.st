"
Classe pour extraire les valeurs du modèle
"
Class {
	#name : #Metrics,
	#superclass : #Object,
	#instVars : [
		'name',
		'fanin',
		'faninvalue',
		'fanout',
		'lcom2',
		'lcom3',
		'numberOfAttributes',
		'numberOfLinesOfCode',
		'numberOfMethods'
	],
	#classVars : [
		'FanIn'
	],
	#category : #MGL843
}

{ #category : #accessing }
Metrics >> fanin [
	^fanin
]

{ #category : #accessing }
Metrics >> fanin: anInteger [ 
	fanin:= anInteger
]

{ #category : #accessing }
Metrics >> fanout [
	^fanout
]

{ #category : #accessing }
Metrics >> fanout: anInteger [
		fanout:= anInteger 
]

{ #category : #accessing }
Metrics >> lcom2 [ 
	^lcom2
]

{ #category : #accessing }
Metrics >> lcom2: aFloat [
		lcom2:= aFloat 
]

{ #category : #accessing }
Metrics >> lcom3 [ 
	^lcom3
]

{ #category : #accessing }
Metrics >> lcom3: aFloat [
		lcom3:= aFloat 
]

{ #category : #accessing }
Metrics >> name [
	^ name
]

{ #category : #accessing }
Metrics >> name: aName [
name:= aName
]

{ #category : #accessing }
Metrics >> numberOfAttributes [
	^numberOfAttributes
]

{ #category : #accessing }
Metrics >> numberOfAttributes: anInteger [
		numberOfAttributes:= anInteger 
]

{ #category : #accessing }
Metrics >> numberOfLinesOfCode [
	^numberOfLinesOfCode
]

{ #category : #accessing }
Metrics >> numberOfLinesOfCode: anInteger [
		numberOfLinesOfCode:= anInteger 
]

{ #category : #accessing }
Metrics >> numberOfMethods [
	^numberOfMethods
]

{ #category : #accessing }
Metrics >> numberOfMethods: anInteger [
		numberOfMethods:= anInteger 
]

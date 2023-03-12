"
Classe pour extraire les valeurs du modèle
"
Class {
	#name : #Metrics,
	#superclass : #Object,
	#instVars : [
		'name',
		'fanin'
	],
	#classVars : [
		'FANIn'
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
Metrics >> name [
	^ name
]

{ #category : #accessing }
Metrics >> name: aName [
name:= aName
]

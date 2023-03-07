"
Please comment me using the following template inspired by Class Responsibility Collaborator (CRC) design: I guess il faut mettre des commentaires

For the Class part:  State a one line summary. For example, ""I represent a paragraph of text"".

For the Responsibility part: Three sentences about my main responsibilities - what I do, what I know.

For the Collaborators Part: State my main collaborators and one line about how I interact with them. 

Public API and Key Messages

- message one   
- message two 
- (for bonus points) how to create instances.

   One simple example is simply gorgeous.
 
Internal Representation and Key Implementation Points.

    Instance Variables
	Export:		<Object>


    Implementation Points
"
Class {
	#name : #CSVExport,
	#superclass : #Object,
	#instVars : [
		'CVSExport',
		'tsModel',
		'fanINClass',
		'data',
		'fileNale'
	],
	#category : #MGL843
}

{ #category : #accessing }
CSVExport >> data [
	^data
]

{ #category : #accessing }
CSVExport >> fanINClass [
	^fanINClass
]

{ #category : #'as yet unclassified' }
CSVExport >> fanInClass: anOrderedCollection [

	fanINClass := tsModel allModelClasses
]

{ #category : #accessing }
CSVExport >> fileName [
	^fileNale
]

{ #category : #accessing }
CSVExport >> tsModel [
^tsModel
]

{ #category : #accessing }
CSVExport >> tsModel: anOrderCollection [

	tsModel:=MooseModel root first
]

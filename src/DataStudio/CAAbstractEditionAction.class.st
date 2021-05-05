Class {
	#name : #CAAbstractEditionAction,
	#superclass : #CAAbstractAction,
	#category : #'DataStudio-Core'
}

{ #category : #testing }
CAAbstractEditionAction >> affectHistory [
	^ false
]

{ #category : #accessing }
CAAbstractEditionAction >> parentLabel [
	^ 'Edit'
]

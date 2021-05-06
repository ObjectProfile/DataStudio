Class {
	#name : #CAInspectAction,
	#superclass : #CAAbstractEditionAction,
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CAInspectAction >> execute [
	self artwork inspect
]

{ #category : #accessing }
CAInspectAction >> menuLabel [
	^ 'Inspect artwork'
]

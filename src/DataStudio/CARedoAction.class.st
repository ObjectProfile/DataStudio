Class {
	#name : #CARedoAction,
	#superclass : #CAAbstractEditionAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CARedoAction >> execute [
	| history action |
	history := self artwork actionsToRedo. 
	history isEmpty ifTrue: [ ^ self inform: 'Nothing to redo' ].
	action := history removeLast.
	action redo.
	self artwork actionsHistory add: action.
	
]

{ #category : #'as yet unclassified' }
CARedoAction >> menuLabel [
	^ 'Redo'
]

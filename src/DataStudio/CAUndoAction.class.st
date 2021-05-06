Class {
	#name : #CAUndoAction,
	#superclass : #CAAbstractEditionAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAUndoAction >> execute [
	| history action |
	history := self artwork actionsHistory. 
	history isEmpty ifTrue: [ ^ self inform: 'Nothing to undo' ].
	action := history removeLast.
	action undo.
	self artwork actionsToRedo add: action.
	
]

{ #category : #accessing }
CAUndoAction >> menuLabel [
	^ 'Undo'
]

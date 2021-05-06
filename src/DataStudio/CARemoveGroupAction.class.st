Class {
	#name : #CARemoveGroupAction,
	#superclass : #CAAbstractGroupAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CARemoveGroupAction >> execute [
	self currentElements remove
]

{ #category : #accessing }
CARemoveGroupAction >> menuLabel [
	^ 'Remove'
]

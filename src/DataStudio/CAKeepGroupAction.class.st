Class {
	#name : #CAKeepGroupAction,
	#superclass : #CAAbstractGroupAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAKeepGroupAction >> execute [
	(self allElements copyWithoutAll: self currentElements) remove
]

{ #category : #accessing }
CAKeepGroupAction >> menuLabel [
	^ 'Keep'
]

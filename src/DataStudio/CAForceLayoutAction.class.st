Class {
	#name : #CAForceLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAForceLayoutAction >> layoutClass [
	^ RTForceBasedLayout 
]

{ #category : #accessing }
CAForceLayoutAction >> menuLabel [
	^ 'Force'
]

Class {
	#name : #CAGridLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAGridLayoutAction >> layoutClass [
	^ RTGridLayout
]

{ #category : #accessing }
CAGridLayoutAction >> menuLabel [
	^ 'Grid'
]

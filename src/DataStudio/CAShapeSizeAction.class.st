Class {
	#name : #CAShapeSizeAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeSizeAction >> doExecute: inputBlock on: relevantElements [
	relevantElements do: [ :anElement | 
		| t |
		t := inputBlock rtValue: anElement model.
		anElement trachelShape extent: t @ t ].

]

{ #category : #accessing }
CAShapeSizeAction >> menuLabel [
	^ 'Size'
]

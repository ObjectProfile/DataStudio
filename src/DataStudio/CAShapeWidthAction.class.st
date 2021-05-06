Class {
	#name : #CAShapeWidthAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeWidthAction >> doExecute: inputBlock on: relevantElements [
	relevantElements do: [ :anElement | 
		anElement trachelShape width: (inputBlock rtValue: anElement model) ].

]

{ #category : #accessing }
CAShapeWidthAction >> menuLabel [
	^ 'Width'
]

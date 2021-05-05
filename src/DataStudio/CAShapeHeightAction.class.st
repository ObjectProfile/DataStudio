Class {
	#name : #CAShapeHeightAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeHeightAction >> doExecute: inputBlock on: relevantElements [
	relevantElements do: [ :anElement | 
		anElement trachelShape height: (inputBlock rtValue: anElement model) ].

]

{ #category : #accessing }
CAShapeHeightAction >> menuLabel [
	^ 'Height'
]

Class {
	#name : #CAShapeNormalizedWidthAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeNormalizedWidthAction >> doExecute: inputBlock on: relevantElements [
	RTMetricNormalizer new
		elements: relevantElements;
		normalizeWidth: inputBlock.

]

{ #category : #accessing }
CAShapeNormalizedWidthAction >> menuLabel [
	^ 'Normalized Width'
]

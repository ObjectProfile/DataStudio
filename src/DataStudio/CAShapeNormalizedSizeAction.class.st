Class {
	#name : #CAShapeNormalizedSizeAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeNormalizedSizeAction >> doExecute: inputBlock on: relevantElements [
	RTMetricNormalizer new
		elements: relevantElements;
		normalizeSize: inputBlock.

]

{ #category : #accessing }
CAShapeNormalizedSizeAction >> menuLabel [
	^ 'Normalized Size'
]

Class {
	#name : #CAShapeNormalizedHeightAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeNormalizedHeightAction >> doExecute: inputBlock on: relevantElements [
	RTMetricNormalizer new
		elements: relevantElements;
		normalizeHeight: inputBlock.

]

{ #category : #accessing }
CAShapeNormalizedHeightAction >> menuLabel [
	^ 'Normalized Height'
]

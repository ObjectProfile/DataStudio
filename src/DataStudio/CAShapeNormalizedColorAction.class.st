Class {
	#name : #CAShapeNormalizedColorAction,
	#superclass : #CAAbstractShapeAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAShapeNormalizedColorAction >> doExecute: inputBlock on: relevantElements [
	RTMetricNormalizer new
		elements: relevantElements;
		normalizeColor: inputBlock;
		alphaColor: 0.8.

]

{ #category : #accessing }
CAShapeNormalizedColorAction >> menuLabel [
	^ 'Normalized Color'
]

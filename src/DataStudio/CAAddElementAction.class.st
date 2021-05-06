Class {
	#name : #CAAddElementAction,
	#superclass : #CAAbstractInteractiveAction,
	#instVars : [
		'elements'
	],
	#category : #'DataStudio-Core'
}

{ #category : #public }
CAAddElementAction >> defaultElementColor [
	^ Color gray
]

{ #category : #'brick-layout' }
CAAddElementAction >> doLayout [
	CAGridLayoutAction new
		artwork: self artwork;
		execute
]

{ #category : #accessing }
CAAddElementAction >> elements [
	^ elements
]

{ #category : #hooks }
CAAddElementAction >> execute [
	self hasArgument ifTrue: [ ^ self processObjects: argument. ].
	self hasAnExpressionSet
		ifFalse: [ expressionAsString := UIManager default
				request: 'Enter a Pharo expression returning a collection'
				initialAnswer: 'Collection withAllSubclasses'.
			(expressionAsString isNil or: [ expressionAsString isEmpty ])
				ifTrue: [ ^ self error: '' ] ].
	self executeUsing: expressionAsString
]

{ #category : #public }
CAAddElementAction >> executeUsing: anExpressionAsString [
	"Public method - Main entry point
	
	The method takes a Pharo expression as argument."

	| result |
	result := OpalCompiler new
		source: anExpressionAsString;
		evaluate.
	(result notNil and: [ result isCollection ])
		ifTrue: [ self processObjects: result ].
	self resetExpressionAsString
]

{ #category : #accessing }
CAAddElementAction >> menuLabel [
	^ '  +  '
]

{ #category : #public }
CAAddElementAction >> processObjects: someObjects [
	elements := RTEllipse new color: self defaultElementColor; elementsOn: someObjects.
	self view addAll: elements.
	elements @ RTDraggable @ RTPopup @ (RTSetEdgeAlpha new onlyOutgoingEdges).
	self registerMenuOn: elements.
	self doLayout.
]

{ #category : #'redo-undo' }
CAAddElementAction >> redo [
	self view addAll: elements.
]

{ #category : #public }
CAAddElementAction >> registerMenuOn: someElements [
	someElements @ (RTMenuActivable new item: 'inspect' action: #inspect )
]

{ #category : #'as yet unclassified' }
CAAddElementAction >> undo [
	elements remove.

]

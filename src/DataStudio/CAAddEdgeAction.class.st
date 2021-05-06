Class {
	#name : #CAAddEdgeAction,
	#superclass : #CAAbstractInteractiveAction,
	#instVars : [
		'edges'
	],
	#category : #'DataStudio-Core'
}

{ #category : #configuration }
CAAddEdgeAction >> defaultEdgesColor [

	^ { Color green . Color red . Color orange }
	"^ RTPalette c10"
]

{ #category : #accessing }
CAAddEdgeAction >> edgeColor [
	^ self defaultEdgesColor at: (self indexOfEdgeAddition \\ self defaultEdgesColor size) + 1
]

{ #category : #accessing }
CAAddEdgeAction >> edges [
	^ edges
]

{ #category : #hooks }
CAAddEdgeAction >> execute [
	| defaultChoices choices myChoiceIndex |
	self hasArgument ifTrue: [ ^ self processBlock: argument. ].
	self hasAnExpressionSet
		ifFalse: [ 
			defaultChoices := self artwork currentObjects flatCollectAsSet: #structuralConnections.
			choices := defaultChoices asArray, #( '- define -' ).
			
			myChoiceIndex := UIManager default chooseFrom: choices.
			myChoiceIndex = 0 ifTrue: [ ^ self ].
		
			"Picked the last one"
			(myChoiceIndex = choices size) 
				ifTrue: 
				[	expressionAsString := UIManager default
						request: 'Enter a symbol or a block'
						initialAnswer: '#subclasses' ]
				ifFalse: [ expressionAsString := (choices at: myChoiceIndex) printString ].
			(expressionAsString isNil or: [ expressionAsString isEmpty ])
				ifTrue: [ ^ self ] ].
	self executeUsing: expressionAsString
]

{ #category : #hooks }
CAAddEdgeAction >> executeUsing: anExpressionAsString [
	| result |
	result := OpalCompiler new
		source: anExpressionAsString;
		evaluate.
	(result notNil and: [ result isSymbol or: [ result isBlock ] ])
		ifTrue: [ self processBlock: result ].
	self resetExpressionAsString
]

{ #category : #accessing }
CAAddEdgeAction >> indexOfEdgeAddition [
	"Return the number of times edges have been added to the artwork"
	^ (artwork actionsHistory select: #isAddingEdge) size
]

{ #category : #testing }
CAAddEdgeAction >> isAddingEdge [
	"This action add edges"
	^ true
]

{ #category : #accessing }
CAAddEdgeAction >> menuLabel [
	^ '+Edge'
]

{ #category : #private }
CAAddEdgeAction >> processBlock: aBlock [
	
	"We need a scope here. Maybe the elements of the current element frame in the artwork"
	| fromElements eb anyOne r |
	fromElements := self currentElements.
	"do nothing if there is no elements"
	fromElements isEmpty ifTrue: [ ^ self ].

	"We pick an element"
	anyOne := fromElements anyOne.
	
	r := aBlock rtValue: anyOne model.
	
	eb := RTEdgeBuilder new.
	eb shape line color: self edgeColor trans.
	eb
		view: self view;
		fromElements: fromElements;
		toElements: self allElements;
		moveBehind.
		
	edges := r isCollection
		ifTrue: [ eb connectToAll: aBlock ]
		ifFalse: [ eb connectTo: aBlock ].
		
	self updateView
	
]

Class {
	#name : #CAAbstractShapeAction,
	#superclass : #CAAbstractInteractiveAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAAbstractShapeAction >> execute [
	| defaultChoices choices myChoiceIndex |
	self hasArgument ifTrue: [ ^ self doExecute: argument on: self currentElements ].
	self hasAnExpressionSet
		ifFalse: [ 
			defaultChoices := self artwork currentObjects flatCollectAsSet: #metrics.
			choices := defaultChoices asArray, #( '- define -' ).
			
			myChoiceIndex := UIManager default chooseFrom: choices.
			myChoiceIndex = 0 ifTrue: [ ^ self ].
		
			"Picked the last one"
			(myChoiceIndex = choices size) 
				ifTrue: 
				[	expressionAsString := UIManager default
						request: 'Enter a symbol or a block'
						initialAnswer: '#numberOfMethods' ]
				ifFalse: [ expressionAsString := (choices at: myChoiceIndex) printString ].
			

			(expressionAsString isNil or: [ expressionAsString isEmpty ])
				ifTrue: [ ^ self ] ].
	self executeUsing: expressionAsString
]

{ #category : #hooks }
CAAbstractShapeAction >> executeUsing: anExpressionAsString [
	| relevantElements inputBlock |
	relevantElements := self currentElements.
	relevantElements isEmpty
		ifTrue: [ ^ self ].
	inputBlock := OpalCompiler new
		source: anExpressionAsString;
		evaluate.
	self doExecute: inputBlock on: relevantElements.
	self resetExpressionAsString
]

{ #category : #accessing }
CAAbstractShapeAction >> parentLabel [
	^ 'Shape'
]

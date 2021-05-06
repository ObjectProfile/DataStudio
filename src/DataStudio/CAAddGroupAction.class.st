Class {
	#name : #CAAddGroupAction,
	#superclass : #CAAbstractInteractiveAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAAddGroupAction >> execute [
	self hasArgument ifTrue: [ ^ self processBlock: argument. ].
	self hasAnExpressionSet
		ifFalse: [ expressionAsString := UIManager default
				request: 'Enter a Pharo expression returning a boolean (e.g., #isTestCase, [:cls | cls isTestCase])'
				initialAnswer: '[ :object | ''*Array*'' match: object printString ]'.
			(expressionAsString isNil or: [ expressionAsString isEmpty ])
				ifTrue: [ ^ self ] ].
	self executeUsing: expressionAsString
]

{ #category : #hooks }
CAAddGroupAction >> executeUsing: anExpressionAsString [
	| aBlock |
	"We create a group"
	"titled as the expression"
	"We give a color to the elements"
	"Add it to the artword (which also has the effect of selecting the group, and therefore give a color to it)"
	aBlock := OpalCompiler evaluate: anExpressionAsString.
	self processBlock: aBlock.
	self resetExpressionAsString
]

{ #category : #accessing }
CAAddGroupAction >> menuLabel [
	^ '+Group'
]

{ #category : #hooks }
CAAddGroupAction >> processBlock: aBlock [
	| elements group relevantElements |
	relevantElements := self view elements
		select: [ :e | e model notNil ].
	relevantElements isEmpty
		ifTrue: [ ^ self ].
	(aBlock isSymbol or: [ aBlock isBlock ])
		ifTrue: [ elements := relevantElements
				select: [ :anElement | aBlock rtValue: anElement model ] ]
		ifFalse: [ aBlock isCollection
				ifTrue: [ elements := relevantElements elementsFromModels: aBlock ]
				ifFalse: [ elements := relevantElements elementsFromModel: aBlock ] ].

	"We create a group"
	group := CAGroup new.
	"titled as the expression"
	group groupName: aBlock printString.
	group elements: elements.

	"We give a color to the elements"
	group highlightElementsUsingIndex: self artwork numberOfGroups.

	"Add it to the artword (which also has the effect of selecting the group, and therefore give a color to it)"
	self artwork addGroup: group
]

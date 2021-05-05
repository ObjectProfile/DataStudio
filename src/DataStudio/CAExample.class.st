Class {
	#name : #CAExample,
	#superclass : #CAObject,
	#category : #'DataStudio-Core'
}

{ #category : #examples }
CAExample >> example01Simple [

	| c |
	c := CAArtwork new.
	c doAction: (CAAddElementAction new argument: (1 to: 7)).
	c doAction: (CAAddEdgeAction new argument: [ :e | e + 1 ]).
	c doAction: (CASwitchLabelAction new).
	c doAction: (CAShapeSizeAction new argument: 30).
	c doAction: (CAGridLayoutAction new).
	^ c view
]

{ #category : #examples }
CAExample >> example02SystemComplexity [

	| c |
	c := CAArtwork new.
	c doAction: (CAAddElementAction new argument: (Collection withAllSubclasses)).
	c doAction: (CAAddEdgeAction new argument: #subclasses).
	c doAction: (CAShapeHeightAction new argument: [ :cls | cls numberOfMethods max: 5 ]).
	c doAction: (CAShapeWidthAction new argument: [ :cls | cls numberOfVariables * 5 max: 5 ]).
	c doAction: (CAShapeNormalizedColorAction new argument: [ :cls | cls numberOfLinesOfCode ]).
	c doAction: (CATreeLayoutAction new).
	
	c doAction: (CAAddGroupAction new argument: [ :cls | '*Array*' match: cls name ]).
	c doAction: (CASwitchLabelAction new).
	^ c view
]

{ #category : #examples }
CAExample >> example03SimpleCodeVisualization [

	| c |
	c := CAArtwork new.
	c doAction: (CAAddElementAction new argument: (Collection withAllSubclasses)).
	c doAction: (CAAddEdgeAction new argument: #subclasses).
	c doAction: (CASwitchLabelAction new).
	c doAction: (CAShapeSizeAction new argument: [ :cls | cls numberOfLinesOfCode sqrt ]).
	c doAction: (CATreeLayoutAction new).
	^ c view
]

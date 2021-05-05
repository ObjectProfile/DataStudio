Class {
	#name : #CAAbstractInteractiveAction,
	#superclass : #CAAbstractAction,
	#instVars : [
		'expressionAsString',
		'argument',
		'expressionAsValue'
	],
	#classInstVars : [
		'lastExpresion'
	],
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CAAbstractInteractiveAction class >> defaultExpression [
	^ nil.
]

{ #category : #accessing }
CAAbstractInteractiveAction class >> lastExpression [
	^ lastExpresion ifNil: [ self defaultExpression ].
]

{ #category : #accessing }
CAAbstractInteractiveAction class >> lastExpression: anObject [
	lastExpresion := anObject
]

{ #category : #accessing }
CAAbstractInteractiveAction >> argument [
	^ argument
]

{ #category : #accessing }
CAAbstractInteractiveAction >> argument: anArgument [
	argument := anArgument
]

{ #category : #accessing }
CAAbstractInteractiveAction >> expressionAsString [
	^ expressionAsString
]

{ #category : #accessing }
CAAbstractInteractiveAction >> expressionAsString: aPharoExpressionAsString [
	expressionAsString := aPharoExpressionAsString
]

{ #category : #testing }
CAAbstractInteractiveAction >> hasAnExpressionSet [
	^ expressionAsString notNil
]

{ #category : #testing }
CAAbstractInteractiveAction >> hasArgument [
	^ argument notNil
]

{ #category : #initialization }
CAAbstractInteractiveAction >> initialize [
	super initialize.
	expressionAsString := nil.
	expressionAsValue := nil
]

{ #category : #actions }
CAAbstractInteractiveAction >> resetExpressionAsString [
	"expressionAsString := nil.
	expressionAsValue := nil"
]

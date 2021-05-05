Class {
	#name : #CAMoveToTheRightLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAMoveToTheRightLayoutAction >> execute [
	| relevantElements remainingElements |
	relevantElements := self artwork currentElements.
	remainingElements := self artwork allElements copyWithoutAll: relevantElements.
	RTGridLayout on: relevantElements.
	TRConstraint move: relevantElements onTheRightOf: remainingElements.
	self updateView
]

{ #category : #accessing }
CAMoveToTheRightLayoutAction >> menuLabel [
	^ 'Move to the right'
]

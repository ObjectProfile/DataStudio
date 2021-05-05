Class {
	#name : #CAMoveUnconnectedLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAMoveUnconnectedLayoutAction >> execute [
	| connected unconnected |
	connected :=  self elements select: #isConnected.
	unconnected := self elements select: #isNotConnected.
	RTGridLayout on: unconnected.
	TRConstraint move: unconnected onTheRightOf: connected.
	self updateView
]

{ #category : #accessing }
CAMoveUnconnectedLayoutAction >> menuLabel [
	^ 'Move unconnected'
]

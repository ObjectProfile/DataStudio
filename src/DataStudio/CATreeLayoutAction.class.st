Class {
	#name : #CATreeLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CATreeLayoutAction >> execute [
	| connected unconnected |
	connected :=  self elements select: #isConnected.
	unconnected := self elements select: #isNotConnected.
	RTTreeLayout on: connected.
	RTGridLayout on: unconnected.
	TRConstraint move: unconnected onTheRightOf: connected.
	self updateView
]

{ #category : #hooks }
CATreeLayoutAction >> layoutClass [
	^ RTTreeLayout
]

{ #category : #accessing }
CATreeLayoutAction >> menuLabel [
	^ 'Tree'
]

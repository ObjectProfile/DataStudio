Class {
	#name : #CAAbstractLayoutAction,
	#superclass : #CAAbstractAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAAbstractLayoutAction >> elements [
	^ self view elements
]

{ #category : #hooks }
CAAbstractLayoutAction >> execute [
	| l |
	l := self layoutInstance.

	l isEdgeDrivenLayout
		ifTrue: [ l
				"userDefinedEdges: self selectEdges;"
				on: self elements edges: self selectEdges ]
		ifFalse: [ l on: self elements ].
	self updateView
]

{ #category : #hooks }
CAAbstractLayoutAction >> layoutClass [
	self subclassResponsibility
]

{ #category : #accessing }
CAAbstractLayoutAction >> layoutInstance [
	^ self layoutClass new
]

{ #category : #accessing }
CAAbstractLayoutAction >> parentLabel [
	"Empty means there is no parent"
	^ 'GroupLayout'
]

{ #category : #utility }
CAAbstractLayoutAction >> selectEdges [
	| actionsAddingEdges index |
	actionsAddingEdges := self artwork actionsHistory select: #isAddingEdge.
	actionsAddingEdges size = 0 ifTrue: [ ^ #() ].
	actionsAddingEdges size = 1 ifTrue: [ ^ actionsAddingEdges first edges ].
	
	index := UIManager default chooseFrom: (actionsAddingEdges collect: #expressionAsString).
	(index isNil or: [ index = 0 ]) ifTrue: [ ^ #() ].
	
	^ (actionsAddingEdges at: index) edges
]

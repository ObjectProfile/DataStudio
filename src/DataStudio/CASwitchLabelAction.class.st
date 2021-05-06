Class {
	#name : #CASwitchLabelAction,
	#superclass : #CAAbstractInteractiveAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CASwitchLabelAction >> execute [
	| es |
	es := self currentElements.
	(RTLabeled hasLabel: es anyOne)
		ifTrue: [ RTLabeled removeLabelFromElements: es ]
		ifFalse: [ es do: [ :e | e @ RTLabeled new setAsHighlightable ] ].
	self updateView
]

{ #category : #accessing }
CASwitchLabelAction >> menuLabel [
	^ 'Labels'
]

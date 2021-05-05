Class {
	#name : #CAAbstractAction,
	#superclass : #CAObject,
	#instVars : [
		'artwork'
	],
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CAAbstractAction class >> allActions [
	| allActions |
	allActions := (self allSubclasses reject: #isAbstract) collect: #new.
	^ allActions sortedAs: [ :a1 :a2 | 
				a1 priority = a2 priority 
					ifTrue: [ a1 menuLabel < a2 menuLabel  ]
					ifFalse: [ a1 priority < a2 priority  ] ].
]

{ #category : #testing }
CAAbstractAction class >> isAbstract [
	^ '*Abstract*' match: self name 
]

{ #category : #testing }
CAAbstractAction >> affectHistory [
	^ true
]

{ #category : #accessing }
CAAbstractAction >> allElements [
	"Return all the elements of the artwork"
	^ self artwork allElements
]

{ #category : #accessing }
CAAbstractAction >> artwork [
	^ artwork
]

{ #category : #accessing }
CAAbstractAction >> artwork: anArtwork [
	artwork := anArtwork
]

{ #category : #accessing }
CAAbstractAction >> currentElements [
	"Return the current elements of the artwork"
	^ self artwork currentElements
]

{ #category : #hooks }
CAAbstractAction >> execute [
	self subclassResponsibility 
]

{ #category : #testing }
CAAbstractAction >> isAddingEdge [
	^ false
]

{ #category : #accessing }
CAAbstractAction >> menuLabel [
	self subclassResponsibility
]

{ #category : #accessing }
CAAbstractAction >> parentLabel [
	"Empty means there is no parent"
	^ ''
]

{ #category : #accessing }
CAAbstractAction >> priority [
	^ 100
]

{ #category : #hooks }
CAAbstractAction >> redo [
	"nothing "
]

{ #category : #hooks }
CAAbstractAction >> undo [
	"nothing "
]

{ #category : #hooks }
CAAbstractAction >> updateView [
	self view canvas focusOnCenterScaled.
	self view signalUpdate
]

{ #category : #accessing }
CAAbstractAction >> view [
	^ artwork view
]

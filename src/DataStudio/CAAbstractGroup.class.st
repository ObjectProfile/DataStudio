Class {
	#name : #CAAbstractGroup,
	#superclass : #CAObject,
	#instVars : [
		'artwork',
		'groupName'
	],
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CAAbstractGroup >> artwork [
	^ artwork
]

{ #category : #accessing }
CAAbstractGroup >> artwork: anArtwork [
	artwork := anArtwork
]

{ #category : #accessing }
CAAbstractGroup >> elements [
	"Return the list of elements, contained in the Artwork"
	self subclassResponsibility 
]

{ #category : #accessing }
CAAbstractGroup >> groupName [
	^ groupName
]

{ #category : #accessing }
CAAbstractGroup >> groupName: aString [
	groupName := aString
]

{ #category : #action }
CAAbstractGroup >> refreshView [
	self artwork view signalUpdate
]

{ #category : #action }
CAAbstractGroup >> select [
"	self elements do: [ :e | 
		e attributeAt: #previousColor put: e trachelShape color.
		e trachelShape color: Color red ]."
	self refreshView
]

{ #category : #action }
CAAbstractGroup >> unselect [
	| previousColor |
"	self elements do: [ :e | 
		previousColor := e attributeAt: #previousColor ifAbsent: [ RTShape defaultColor ].
		e removeAttributeAt: #previousColor ifAbsent: [ ].
		e trachelShape color: previousColor ]."
	self refreshView
]

Class {
	#name : #CAGroup,
	#superclass : #CAAbstractGroup,
	#instVars : [
		'elements'
	],
	#category : #'DataStudio-Core'
}

{ #category : #'private-utility' }
CAGroup >> colorElements [
	"Color all the elements of the group. Use a defined palette and the number of total groups"
	
	| color |
	color := RTPalette c1 indexOf: (self artwork numberOfGroups \\ 5).
	self elements do: [ :e | e trachelShape color: color ]
]

{ #category : #accessing }
CAGroup >> elements [
	^ elements
]

{ #category : #accessing }
CAGroup >> elements: someElements [
	elements := someElements.

]

{ #category : #'private-utility' }
CAGroup >> highlightElementsUsingIndex: anIndex [
	"Color all the elements of the group. Use a defined palette and the number of total groups"
	
	| color |
	color := RTPalette c1 at: (anIndex \\ 5).
	self elements do: [ :e | e trachelShape color: color ].
	self elements anyOne view signalUpdate
]

{ #category : #initialization }
CAGroup >> initialize [
	super initialize.
	elements := #().
	self groupName: '#yourself'
]

{ #category : #action }
CAGroup >> select [
	self elements do: [ :e | RTBlink on: e ]
]

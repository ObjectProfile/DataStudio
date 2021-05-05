Class {
	#name : #CANoGroup,
	#superclass : #CAAbstractGroup,
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CANoGroup >> elements [
	"Return the list of elements, contained in the Artwork"
	^ self artwork view elements
]

{ #category : #initialization }
CANoGroup >> initialize [
	super initialize.
	self groupName: 'None'
]

{ #category : #action }
CANoGroup >> select [
	^ self unselect
]

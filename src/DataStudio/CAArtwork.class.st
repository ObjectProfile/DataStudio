Class {
	#name : #CAArtwork,
	#superclass : #CAObject,
	#instVars : [
		'view',
		'groups',
		'currentGroup',
		'labelForGroupName',
		'actionsHistory',
		'actionsRedo'
	],
	#category : #'DataStudio-Core'
}

{ #category : #'world menu' }
CAArtwork class >> menuCommandOn: aBuilder [
	<worldMenu>
	(aBuilder item:  #DataStudio; order: 10) 
		label: 'Data Studio';
		icon: (self iconNamed: #databaseAdd);
		withSeparatorAfter;
		with: [ 
			(aBuilder item: #basic)
				order: 0.1; 
				icon: (self iconNamed: #databaseAdd);
				label: 'Open DataStudio';
				action: [ CAArtwork new view inspect ] ].
	
]

{ #category : #accessing }
CAArtwork >> actionsHistory [
	^ actionsHistory
]

{ #category : #accessing }
CAArtwork >> actionsToRedo [
	^ actionsRedo
]

{ #category : #adding }
CAArtwork >> addGroup: aCAGroup [
	groups add: aCAGroup.
	aCAGroup artwork: self.
	self currentGroup: aCAGroup
]

{ #category : #accessing }
CAArtwork >> allElements [
	"Return all the elements contained in the view"
	^ self view elements select: [ :e | e model notNil ]
]

{ #category : #accessing }
CAArtwork >> currentElements [
	"Return the list of elements that belong to the group that is selected"
	^ self currentGroup elements select: [ :e | e model notNil ]
]

{ #category : #accessing }
CAArtwork >> currentGroup [
	^ currentGroup
]

{ #category : #accessing }
CAArtwork >> currentGroup: aCAGroup [
	currentGroup unselect.
	aCAGroup select.
	currentGroup := aCAGroup.
	labelForGroupName text: aCAGroup groupName.
	TRConstraint moveAtTheBottomRightOfTheWindow: labelForGroupName

]

{ #category : #accessing }
CAArtwork >> currentModels [
	^ self currentElements collect: #model
]

{ #category : #accessing }
CAArtwork >> currentObjects [
	"Return the list of object that belong to the group that is selected"
	^ self currentElements collect: #model
]

{ #category : #public }
CAArtwork >> doAction: action [
	"This is an essential method."
	action artwork: self.
	[ 
		action execute.
		action affectHistory ifTrue: [ 
			actionsHistory add: action.
			actionsRedo removeAll.
		] ] on: Error 
		do: [ :ex | self inform: ex messageText ].

]

{ #category : #accessing }
CAArtwork >> groups [
	^ groups copy
]

{ #category : #initialization }
CAArtwork >> initialize [
	super initialize.
	view := RTView new.
	view @ RTDraggableView.
	labelForGroupName := TRLabelShape new text: 'No group selected'.
	actionsHistory := OrderedCollection new.
	actionsRedo := OrderedCollection new.
	self initializeGroups.
	self initializeView: view
]

{ #category : #initialization }
CAArtwork >> initializeGroups [
	groups := OrderedCollection new.
	currentGroup := CANoGroup new.
	self addGroup: currentGroup
]

{ #category : #initialization }
CAArtwork >> initializeView: aView [
	| mb |
	mb := RTMenuBuilder new view: aView.
	CAAbstractAction allActions do: [ :a |
		a parentLabel isEmpty 
			ifTrue: [ mb
							menu: a menuLabel
							callback: [ self doAction: a copy ] ]
			ifFalse: [ mb
							menu: a parentLabel
							submenu: a menuLabel
							callback: [ self doAction: a copy ] ].
	].

	view canvas addFixedShape: labelForGroupName.
	TRConstraint stickAtTheBottomRightOfTheWindow: labelForGroupName

]

{ #category : #accessing }
CAArtwork >> numberOfActions [
	"Return the number of actions that have been executed"
	^ actionsHistory size
]

{ #category : #accessing }
CAArtwork >> numberOfActionsToRedo [
	"Return the number of actions that have been executed"
	^ actionsRedo size
]

{ #category : #accessing }
CAArtwork >> numberOfGroups [
	^ groups size
]

{ #category : #accessing }
CAArtwork >> view [
	^ view
]

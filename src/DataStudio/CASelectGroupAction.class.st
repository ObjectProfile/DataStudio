Class {
	#name : #CASelectGroupAction,
	#superclass : #CAAbstractInteractiveAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CASelectGroupAction >> execute [
	| groups groupNames groupToSelect |
	groups := self artwork groups.
	groupNames := groups collect: #groupName.
	groupToSelect := UIManager default chooseFrom: groupNames values: groups title: 'Select a group'.
	groupToSelect ifNil: [ ^ self ].
	self artwork currentGroup: groupToSelect.
	self resetExpressionAsString
]

{ #category : #accessing }
CASelectGroupAction >> menuLabel [
	^ 'SelectGroup'
]

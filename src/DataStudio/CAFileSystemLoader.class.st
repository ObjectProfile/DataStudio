"
I am a menu command to inspect the file system
"
Class {
	#name : #CAFileSystemLoader,
	#superclass : #CALoader,
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CAFileSystemLoader class >> label [
	"Override to return a String"

	^ 'Inspect File System'
]

{ #category : #hooks }
CAFileSystemLoader >> doExecute [
	| root |
	root := UIManager default 
		chooseDirectory: 'Choose the root of an application source code'
		path: self class lastPath.
	root isNil ifTrue: [ ^ self ].
	root inspect.
	self class lastPath: root.
]

{ #category : #loading }
CAFileSystemLoader >> forceLoad [
	"Override to load the necessary"

]

"
I am a loader for different projects and visualizations that works with Artwork of Data studio.

My subclasses needs to implement 
doExecute
forceLoad
and isLoaded
"
Class {
	#name : #CALoader,
	#superclass : #CAObject,
	#classInstVars : [
		'lastPath'
	],
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CALoader class >> keyText [
	^ nil
]

{ #category : #'world menu' }
CALoader class >> label [
	"Override to return a String"
	self subclassResponsibility
]

{ #category : #accessing }
CALoader class >> lastPath [
	^ lastPath
]

{ #category : #accessing }
CALoader class >> lastPath: aPath [
	lastPath := aPath
]

{ #category : #'world menu' }
CALoader class >> menuCommandOn: aBuilder [
	<worldMenu>
	self allSubclasses do: [ :c |
		(aBuilder item: #'DataStudio')
			order: 0.1; 
			parent: #DataStudio;
			label: c label;
			keyText: c keyText;
			action: [ c new execute ] ]
]

{ #category : #hooks }
CALoader >> doExecute [
	self subclassResponsibility
]

{ #category : #hooks }
CALoader >> execute [
	self loadPeterFileDialogIfNecessary.
	self loadIfNecessary.
	self doExecute
]

{ #category : #loading }
CALoader >> forceLoad [
	"Override to load the necessary"
	self subclassResponsibility 
]

{ #category : #testing }
CALoader >> isLoaded [
	^ false
]

{ #category : #loading }
CALoader >> load [
	self loadIfNecessary
]

{ #category : #loading }
CALoader >> loadIfNecessary [
	self isLoaded ifFalse: [ 
		self forceLoad ]
]

{ #category : #util }
CALoader >> loadPeterFileDialogIfNecessary [
	"
	self new loadPeterFileDialogIfNecessary
	"
	(Smalltalk includesKey: #FDOpenFileDialog) ifFalse: [
		Metacello new
		    baseline: 'FileDialog';
		    repository: 'github://peteruhnak/file-dialog/repository';
		    load ].
	(Smalltalk at: #FDMorphicUIManager) new beDefault
]

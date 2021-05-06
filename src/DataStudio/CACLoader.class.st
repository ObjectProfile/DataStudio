"
I am the menu command and loader for DataStudio-CProjectVisualization
"
Class {
	#name : #CACLoader,
	#superclass : #CALoader,
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CACLoader class >> label [
	"Override to return a String"

	^ 'Analyze C / C++ source code'
]

{ #category : #hooks }
CACLoader >> doExecute [

	"The following code shows dependencies between "
	| root p |
	root := UIManager default 
		chooseDirectory: 'Choose the root of an application source code' 
		path: self class lastPath.
	root ifNil: [ ^ self ].

	p := CPPProcessor new.
	p processRootFolder: root.
	p resolveDependencies.
	p inspect.
	self class lastPath: root.
]

{ #category : #testing }
CACLoader >> forceLoad [

	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'DataStudio';
		package: 'DataStudio-CProjectVisualizer'; 
		load
]

{ #category : #testing }
CACLoader >> isLoaded [
	^  Smalltalk hasClassNamed: #CPPProcessor 
]

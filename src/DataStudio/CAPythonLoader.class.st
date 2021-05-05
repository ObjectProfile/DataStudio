"
I am the menu command and the loader for DataStudio-PythonAnalizer
"
Class {
	#name : #CAPythonLoader,
	#superclass : #CALoader,
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CAPythonLoader class >> label [
	"Override to return a String"
	^ 'Analyze Python source code'
]

{ #category : #hooks }
CAPythonLoader >> doExecute [
	| root p |
	root := UIManager default
		chooseDirectory: 'Choose the root of an application source code'
		path: self class lastPath.
	root ifNil: [ ^ self ].
	p := (Smalltalk at: #PyProcessor) new.
	p processRootFolder: root.
	p resolveDependencies.
	p inspect.
	self class lastPath: root.
]

{ #category : #loading }
CAPythonLoader >> forceLoad [

	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'DataStudio';
		package: 'DataStudio-PythonAnalyzer'; 
		load.
]

{ #category : #testing }
CAPythonLoader >> isLoaded [
	^ Smalltalk hasClassNamed: #PyProcessor 
]

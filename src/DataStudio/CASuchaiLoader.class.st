"
I am the menu command and the loader for the package DataStudio-SUCHAIAnalizer
"
Class {
	#name : #CASuchaiLoader,
	#superclass : #CALoader,
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CASuchaiLoader class >> keyText [
	^ 'o, c'
]

{ #category : #'world menu' }
CASuchaiLoader class >> label [
	"Override to return a String"
	^ 'Analize SUCHAI code'
]

{ #category : #hooks }
CASuchaiLoader >> doExecute [
	| root p w |
	self class lastPath ifNil: [ 
			root := UIManager default
			chooseDirectory: 'Choose the root of the application source code'.
			root ifNil: [ ^ self ] ]
		ifNotNil: [ root := self class lastPath ] .
	
	p := (Smalltalk at: #CPPSUCHAIProcessor) new.
	p processRootFolder: root.
	p resolveDependencies.
	w := Smalltalk tools inspector openOn: p.
	w center: w world clearArea center.
	self class lastPath: root.
]

{ #category : #loading }
CASuchaiLoader >> forceLoad [

	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'DataStudio';
		package: 'DataStudio-CProjectVisualizer'; 
		load.
	Gofer new 
		smalltalkhubUser: 'ObjectProfile' project: 'DataStudio';
		package: 'DataStudio-SUCHAIAnalizer'; 
		load.
]

{ #category : #testing }
CASuchaiLoader >> isLoaded [
	^  Smalltalk hasClassNamed: #CPPSUCHAIProcessor 
]

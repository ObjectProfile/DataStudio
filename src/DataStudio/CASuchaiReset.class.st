"
I am a menu command to reset the last path for the suchai application
"
Class {
	#name : #CASuchaiReset,
	#superclass : #CALoader,
	#category : #'DataStudio-Model'
}

{ #category : #'world menu' }
CASuchaiReset class >> label [
	"Override to return a String"
	^ 'Reset SUCCHAI PATH'
]

{ #category : #hooks }
CASuchaiReset >> doExecute [
	CASuchaiLoader lastPath: nil.
	self inform: 'DONE'.
]

{ #category : #loading }
CASuchaiReset >> forceLoad [
	"Override to load the necessary"

]

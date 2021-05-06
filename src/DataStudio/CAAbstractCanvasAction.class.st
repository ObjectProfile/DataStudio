Class {
	#name : #CAAbstractCanvasAction,
	#superclass : #CAAbstractAction,
	#category : #'DataStudio-Core'
}

{ #category : #accessing }
CAAbstractCanvasAction >> parentLabel [
	"Empty means there is no parent"
	^ 'Canvas'
]

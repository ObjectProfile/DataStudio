Class {
	#name : #CAClearCanvasAction,
	#superclass : #CAAbstractCanvasAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAClearCanvasAction >> execute [
	self view removeAllElements. 
	self updateView 
	
]

{ #category : #accessing }
CAClearCanvasAction >> menuLabel [
	^ 'Total Clear'
]

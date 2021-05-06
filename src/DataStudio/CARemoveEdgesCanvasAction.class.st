Class {
	#name : #CARemoveEdgesCanvasAction,
	#superclass : #CAAbstractCanvasAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CARemoveEdgesCanvasAction >> execute [
	self view removeAllEdges. 
	self updateView 
	
]

{ #category : #accessing }
CARemoveEdgesCanvasAction >> menuLabel [
	^ 'Remove all edges'
]

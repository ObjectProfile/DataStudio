Class {
	#name : #CAFlowLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAFlowLayoutAction >> layoutClass [
	^ RTFlowLayout
]

{ #category : #accessing }
CAFlowLayoutAction >> menuLabel [
	^ 'Flow'
]

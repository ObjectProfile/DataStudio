Class {
	#name : #CAVerticalLineLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAVerticalLineLayoutAction >> layoutClass [
	^ RTVerticalLineLayout 
]

{ #category : #accessing }
CAVerticalLineLayoutAction >> menuLabel [
	^ 'VLine'
]

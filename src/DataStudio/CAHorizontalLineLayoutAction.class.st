Class {
	#name : #CAHorizontalLineLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAHorizontalLineLayoutAction >> layoutClass [
	^ RTHorizontalLineLayout 
]

{ #category : #accessing }
CAHorizontalLineLayoutAction >> menuLabel [
	^ 'HLine'
]

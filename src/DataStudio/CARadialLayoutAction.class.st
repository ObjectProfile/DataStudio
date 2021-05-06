Class {
	#name : #CARadialLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CARadialLayoutAction >> layoutClass [
	^ RTRadialTreeLayout
]

{ #category : #accessing }
CARadialLayoutAction >> menuLabel [
	^ 'Radial Tree'
]

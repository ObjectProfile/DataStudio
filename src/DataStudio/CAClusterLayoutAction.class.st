Class {
	#name : #CAClusterLayoutAction,
	#superclass : #CAAbstractLayoutAction,
	#category : #'DataStudio-Core'
}

{ #category : #hooks }
CAClusterLayoutAction >> layoutClass [
	^ RTClusterLayout
]

{ #category : #accessing }
CAClusterLayoutAction >> menuLabel [
	^ 'Cluster'
]

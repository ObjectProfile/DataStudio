Extension { #name : #Object }

{ #category : #'*DataStudio' }
Object >> connectedObjects [
	"
	(3 @ 5) connectedObjects
	"
	| vars |
	vars := self class instVarNames.
	^ vars collect: [ :v | self instVarNamed: v ]
]

{ #category : #'*DataStudio' }
Object >> groups [
	^ #()
]

{ #category : #'*DataStudio' }
Object >> metrics [
	^ #()
]

{ #category : #'*DataStudio' }
Object >> structuralConnections [
	^ #(#connectedObjects)
]

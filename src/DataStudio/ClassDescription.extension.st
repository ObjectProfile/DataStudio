Extension { #name : #ClassDescription }

{ #category : #'*DataStudio' }
ClassDescription >> groups [
	^ { #isTestCase }
]

{ #category : #'*DataStudio' }
ClassDescription >> metrics [
	^ #(#numberOfVariables #numberOfMethods #numberOfLinesOfCode #numberOfSuperclasses #numberOfInstances)
]

{ #category : #'*DataStudio' }
ClassDescription >> structuralConnections [
	^ #( #dependentClasses #subclasses )
]

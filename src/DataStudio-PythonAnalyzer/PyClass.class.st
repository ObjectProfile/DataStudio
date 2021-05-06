Class {
	#name : #PyClass,
	#superclass : #PyStructuralElement,
	#instVars : [
		'methods',
		'subclasses',
		'superclasses',
		'superclassNames'
	],
	#category : #'DataStudio-PythonAnalyzer-Core'
}

{ #category : #adding }
PyClass >> addMethod: aMethod [
	methods add: aMethod.
	aMethod file: self file.
]

{ #category : #adding }
PyClass >> addSubclass: aPyClass [
	(subclasses includes: aPyClass)
		ifFalse: [ subclasses add: aPyClass ]
]

{ #category : #'public - accessing' }
PyClass >> dependentClasses [
	"Return the list of dependent classes, based on the method outgoing invocations"
	^ (((self methods flatCollect: #outgoingMethods) select: [ :m | m isKindOf: PyMethod ]) collect: #pythonClass) asSet
]

{ #category : #'public - testing' }
PyClass >> hasSuperclass [
	"Return true if a superclass exist"
	^ self superclass notNil 
]

{ #category : #'public - testing' }
PyClass >> hasSuperclassOrSubclasses [
	"Return true if a superclass exist or if it has any subclasses
	Here is an example (Run on a PyProcessor):
	

b := RTMondrian new.
b shape box 
	size: #numberOfMethods.
b nodes: (self classes select: #hasSuperclassOrSubclasses).
b layout 
	tree;
	ifNotConnectedThen: RTGridLayout new.
b edges connectFrom: #superclass.
b normalizer normalizeColor: #numberOfLinesOfCode.
b	
	"
	^ self superclass notNil or: [ self subclasses notEmpty ]
]

{ #category : #initialization }
PyClass >> initialize [
	super initialize.
	methods := OrderedCollection new.
	superclasses := OrderedCollection new..
	superclassNames := OrderedCollection new..
	subclasses := OrderedCollection new
]

{ #category : #'public - accessing' }
PyClass >> methods [
	^ methods
]

{ #category : #datastudio }
PyClass >> metrics [
	^ #(#numberOfMethods #numberOfLinesOfCode)
]

{ #category : #metrics }
PyClass >> numberOfMethods [
	^ methods size
]

{ #category : #datastudio }
PyClass >> structuralConnections [
	^ #(#subclasses #dependentClasses)
]

{ #category : #'public - accessing' }
PyClass >> subclasses [
	"Return the list of subclasses of myself"
	^ subclasses
]

{ #category : #'public - accessing' }
PyClass >> superclass [
	"Return the first declared superclass"
	self superclasses ifEmpty: [ ^ nil ].
	^ self superclasses first
]

{ #category : #'public - accessing' }
PyClass >> superclass: pyClass [
	"Add a superclass"
	superclasses add: pyClass.
	pyClass addSubclass: self.
]

{ #category : #'public - accessing' }
PyClass >> superclassName [
	"Return the name of the first declared superclass"
	^ superclassNames anyOne
]

{ #category : #'public - accessing' }
PyClass >> superclassName: aString [
	self assert: [ aString isByteString ].
	superclassNames add: aString
]

{ #category : #'public - accessing' }
PyClass >> superclassNames [
	"Return the list of declared superclass names"
	^ superclassNames
]

{ #category : #'public - accessing' }
PyClass >> superclassNames: someNames [
	self assert: [ someNames isCollection ].
	superclassNames := someNames copy.
]

{ #category : #'public - accessing' }
PyClass >> superclasses [
	"Return the list of superclasses of myself"
	^ superclasses
]

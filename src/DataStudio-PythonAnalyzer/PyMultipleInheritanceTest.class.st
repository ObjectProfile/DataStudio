Class {
	#name : #PyMultipleInheritanceTest,
	#superclass : #TestCase,
	#instVars : [
		'p'
	],
	#category : #'DataStudio-PythonAnalyzer-Tests'
}

{ #category : #initialization }
PyMultipleInheritanceTest >> setUp [
	p := PyProcessor new.
]

{ #category : #tests }
PyMultipleInheritanceTest >> testBasic [
	| code |
	code := 
'class Base1:
    pass

class Base2:
    pass

class MultiDerived(Base1, Base2):
    pass'.
	p processFileAsString: code named: 'exampleMultipleInheritance.py'.
	
	self assert: p numberOfClasses equals: 3.
	self assert: p classes first superclass isNil.
	self assert: p classes first superclassName equals: 'object'.

	self assert: p classes second superclass isNil.
	self assert: p classes second superclassName equals: 'object'.
	
	self assert: p classes third superclass isNil.
	self assert: p classes third superclassNames equals: #('Base1' 'Base2').
	
	p resolveDependencies.
	self assert: p classes first superclass isNil.
	self assert: p classes second superclass isNil.
	self assert: p classes third superclasses size equals: 2.
	self assert: p classes third superclasses asArray equals: (Array with: p classes first with: p classes second) asArray
]

{ #category : #tests }
PyMultipleInheritanceTest >> testBasic02 [
	| code |
	code := 
'class Base1:
    pass

class Base2:
    pass

class MultiDerived(Base10, Base2):
    pass'.
	p processFileAsString: code named: 'exampleMultipleInheritance.py'.
	
	self assert: p numberOfClasses equals: 3.
	self assert: p classes first superclass isNil.
	self assert: p classes first superclassName equals: 'object'.

	self assert: p classes second superclass isNil.
	self assert: p classes second superclassName equals: 'object'.
	
	self assert: p classes third superclass isNil.
	self assert: p classes third superclassNames equals: #('Base10' 'Base2').
	
	p resolveDependencies.
	self assert: p classes first superclass isNil.
	self assert: p classes second superclass isNil.
	self assert: p classes third superclassNames equals: #('Base10' 'Base2').
	self assert: p classes third superclasses size equals: 1.
	self assert: p classes third superclasses asArray equals: (Array with: p classes second) asArray
]

{ #category : #tests }
PyMultipleInheritanceTest >> testBasic03 [
	| code |
	code := 
'class Base1:
    pass

class Base2:
    pass

class MultiDerived(foo.Base1, Base2):
    pass'.
	p processFileAsString: code named: 'exampleMultipleInheritance.py'.
	
	self assert: p numberOfClasses equals: 3.
	self assert: p classes first superclass isNil.
	self assert: p classes first superclassName equals: 'object'.

	self assert: p classes second superclass isNil.
	self assert: p classes second superclassName equals: 'object'.
	
	self assert: p classes third superclass isNil.
	self assert: p classes third superclassNames equals: #('foo.Base1' 'Base2').
	
	p resolveDependencies.
	self assert: p classes first superclass isNil.
	self assert: p classes second superclass isNil.
	self assert: p classes third superclassNames equals: #('foo.Base1' 'Base2').
	self assert: p classes third superclasses size equals: 2.
	self assert: p classes third superclasses asArray equals: (Array with: p classes first with: p classes second) asArray
]

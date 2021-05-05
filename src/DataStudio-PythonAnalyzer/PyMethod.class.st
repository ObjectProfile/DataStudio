Class {
	#name : #PyMethod,
	#superclass : #PyAbstractBehavior,
	#instVars : [
		'pythonClass'
	],
	#category : #'DataStudio-PythonAnalyzer-Core'
}

{ #category : #accessing }
PyMethod >> pythonClass [
	"Return the class that defines the method"
	^ pythonClass
]

{ #category : #accessing }
PyMethod >> pythonClass: aPyClass [
	pythonClass := aPyClass
]

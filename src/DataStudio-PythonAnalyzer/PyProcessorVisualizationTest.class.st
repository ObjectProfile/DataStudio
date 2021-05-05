Class {
	#name : #PyProcessorVisualizationTest,
	#superclass : #TestCase,
	#instVars : [
		'p'
	],
	#category : #'DataStudio-PythonAnalyzer-Tests'
}

{ #category : #initialization }
PyProcessorVisualizationTest >> setUp [
	p := PyProcessor new.
]

{ #category : #tests }
PyProcessorVisualizationTest >> testFilehierarchy [
	p processFileAsString: PyProcessorTest new file02 named: 'file2'.
	p fileHierarchy
]

{ #category : #tests }
PyProcessorVisualizationTest >> testSystemComplexity [
	p processFileAsString: PyProcessorTest new file02 named: 'file2'.
	p systemComplexity
]

{ #category : #tests }
PyProcessorVisualizationTest >> testartworkOnClasses [
	p processFileAsString: PyProcessorTest new file02 named: 'file2'.
	p artworkOnClasses
]

{ #category : #tests }
PyProcessorVisualizationTest >> testartworkOnFiles [
	p processFileAsString: PyProcessorTest new file02 named: 'file2'.
	p artworkOnFiles
]

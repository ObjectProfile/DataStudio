"
TODO
"
Class {
	#name : #BaselineOfDataStudio,
	#superclass : #BaselineOf,
	#category : #BaselineOfDataStudio
}

{ #category : #baselines }
BaselineOfDataStudio >> baseline: spec [
	<baseline>
	spec for: #common do: [
		spec 
			baseline: 'Roassal2'
			with: [ spec repository: 'github://ObjectProfile/Roassal2/src' ].
		spec
			package: #'DataStudio' with: [ spec requires: #('Roassal2') ]; 
			package: #'DataStudio-CProjectVisualizer';
			package: #'DataStudio-PythonAnalyzer'. 
		
		 ]
]

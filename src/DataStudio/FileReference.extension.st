Extension { #name : #FileReference }

{ #category : #'*DataStudio' }
FileReference >> gtInspectorViewIn: composite [
	<gtInspectorPresentationOrder: -10>
	self isDirectory ifFalse: [ ^ self ].
	composite roassal2
		title: 'Hierarchy';
		initializeView:
				[ self viewHierarchy ]
]

{ #category : #'*DataStudio' }
FileReference >> viewHierarchy [
	| b |
	b := RTMondrian new.
	b shape box 
		if: #isDirectory fillColor: Color blue.
	b interaction popupText: [ :fr | fr basename asString, ' ', (((fr allChildren collect: #size) sum / 1000000) round: 2) asString , ' MB' ].
	b nodes: (self children).
	b layout grid.
	b normalizer normalizeSize: [ :f | (f allChildren collect: #size) sum ].
	^ b
]

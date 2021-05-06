Extension { #name : #SequenceableCollection }

{ #category : #'*DataStudio' }
SequenceableCollection >> asDSColl [
	^ DSRCollection withAll: self
]

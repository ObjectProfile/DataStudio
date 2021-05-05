Class {
	#name : #CAActionTest,
	#superclass : #CATest,
	#category : #'DataStudio-Core'
}

{ #category : #tests }
CAActionTest >> testAffectHistory [
	
]

{ #category : #tests }
CAActionTest >> testAllActions [
	| actions vv |
	actions := CAAbstractAction allActions.
	self assert: actions isCollection.
	self assert: (actions noneSatisfy: #isBehavior). 
	self assert: ((actions collect: #class) noneSatisfy: #isAbstract).

	vv := actions sortedAs: [ :a1 :a2 | 
				a1 priority = a2 priority 
					ifTrue: [ a1 menuLabel < a2 menuLabel  ]
					ifFalse: [ a1 priority < a2 priority  ] ].
			
	self assert: vv asArray equals: actions asArray
]

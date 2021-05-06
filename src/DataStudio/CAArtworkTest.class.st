Class {
	#name : #CAArtworkTest,
	#superclass : #CATest,
	#instVars : [
		'a'
	],
	#category : #'DataStudio-Core'
}

{ #category : #'tests - edition' }
CAArtworkTest >> messageSelectorAndArgumentNames [
	"comment stating purpose of message"

	| a1 a2 |
	self assert: a numberOfActions equals: 0.
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 1.
	a doAction: (CAUndoAction new).
	self assert: a numberOfActions equals: 1.
]

{ #category : #initialization }
CAArtworkTest >> setUp [
	super setUp.
	a := CAArtwork new
]

{ #category : #'tests - action history' }
CAArtworkTest >> testActionHistory [
	| a1 a2 |
	self assert: a numberOfActions equals: 0.
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 1.
	
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 2.
	
	a1 := CAAddEdgeAction new expressionAsString: '[:v | v + 1]'.
	a doAction: a1.
	self assert: a view numberOfEdges equals: 4.
	self assert: a numberOfActions equals: 3.
	self assert: a1 indexOfEdgeAddition equals: 1.
	
	a2 := CAAddEdgeAction new expressionAsString: '[ :v | 1 ]'.
	a doAction: a2.
	self assert: a view numberOfEdges equals: 8.
	self assert: a numberOfActions equals: 4.
	self assert: a2 indexOfEdgeAddition equals: 2.
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddGroup [
	| g |
	g := CAGroup new.
	self assert: g artwork isNil.
	a addGroup: g.
	self assert: g artwork equals: a.
	self assert: a currentGroup equals: g
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddingGroup [

	| noGroup oddGroup evenGroup |
	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	noGroup := a currentGroup.
	a doAction: (CAAddGroupAction new expressionAsString: '#odd').
	oddGroup := a currentGroup.
	a doAction: (CAAddGroupAction new expressionAsString: '#even').
	evenGroup := a currentGroup.
	
	self assert: noGroup ~= oddGroup.
	self assert: noGroup ~= evenGroup.
	self assert: oddGroup ~= evenGroup.
	
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddingGroup02 [

	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	a doAction: (CAAddGroupAction new expressionAsString: '3').
	self assert: a currentObjects size equals: 1.
	self assert: a currentObjects anyOne equals: 3.
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddingGroup03 [

	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	a doAction: (CAAddGroupAction new expressionAsString: '#(2 4)').
	self assert: a currentObjects size equals: 2.
	self assert: a currentObjects asArray equals: #(2 4).
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddingGroup04 [

	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	a doAction: (CAAddGroupAction new expressionAsString: '#even').
	self assert: a currentObjects size equals: 2.
	self assert: a currentObjects asArray equals: #(2 4).
]

{ #category : #'tests - group' }
CAArtworkTest >> testAddingGroupWithoutElements [
	| action |
	action := CAAddGroupAction new expressionAsString: '#odd'.
	a doAction: action.
	self assert: a numberOfGroups equals: 1.
	
]

{ #category : #tests }
CAArtworkTest >> testBasic [
	self assert: a view class equals: RTView.
	self assert: a view numberOfElements equals: 0.
	self assert: a numberOfGroups equals: 1.
	self assert: a currentGroup notNil.
	self assert: a currentGroup class equals: CANoGroup.
	self assert: a numberOfActions equals: 0
]

{ #category : #tests }
CAArtworkTest >> testCurrentElements [
	
	self assert: a currentElements isEmpty.
	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	self assert: a currentElements size equals: 4.
 
]

{ #category : #'tests - actions' }
CAArtworkTest >> testDoAction [
	self assert: a view numberOfElements equals: 0.
	a doAction: (CAAddElementAction new expressionAsString: 'Collection withAllSubclasses').
	self assert: a view numberOfElements equals: Collection withAllSubclasses size.
	self assert: a view numberOfEdges equals: 0.

	a doAction: (CAAddEdgeAction new expressionAsString: '#subclasses').
	self assert: a view numberOfEdges > 0
]

{ #category : #'tests - actions' }
CAArtworkTest >> testDoActionWithEdgeAndGroup [
	| edge |
	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3)').
	a doAction: (CAAddGroupAction new expressionAsString: '1').
	a doAction: (CAAddEdgeAction new expressionAsString: '[ :v | v + 1 ]').
	self assert: a view numberOfEdges equals: 1.
	
	edge := a view edges anyOne.
	self assert: edge from model equals: 1.
	self assert: edge to model equals: 2.
]

{ #category : #'tests - group' }
CAArtworkTest >> testDoGroupSelection [
	
	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	self assert: a currentElements size equals: 4.
 
	a doAction: (CAAddGroupAction new expressionAsString: '#odd').
	self assert: a numberOfGroups equals: 2.
	self assert: a currentElements size equals: 2.
	self assert: a currentModels asArray equals: #(1 3).
]

{ #category : #'tests - actions' }
CAArtworkTest >> testDoLayout [
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	CAAbstractLayoutAction subclasses do: [ :s |
		a doAction: s new ]
	
]

{ #category : #'tests - group' }
CAArtworkTest >> testExpressionAsString [
	| ac |
	ac := CAAddElementAction new.
	self assert: ac expressionAsString isNil.
	ac expressionAsString: '#(1 2 3 4)'.
	self assert: ac expressionAsString notNil.
	a doAction: ac.
	self assert: ac expressionAsString notNil.
	
]

{ #category : #'tests - layout' }
CAArtworkTest >> testLayoutAndEdgesNoSelection [

	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 10)').
	a doAction: (CAAddEdgeAction new expressionAsString: '[ :v | v // 2 ]').
	a doAction: (CAAddEdgeAction new expressionAsString: '[ :v | v // 3 ]').
	a doAction: (CAGridLayoutAction new).
]

{ #category : #'tests - layout' }
CAArtworkTest >> testLayoutAndEdgesSelection [

	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 10)').
	a doAction: (CAAddEdgeAction new expressionAsString: '[ :v | v // 3 ]').
	a doAction: (CATreeLayoutAction new).
]

{ #category : #tests }
CAArtworkTest >> testMenuCommand [
	| builder |
	builder := PragmaMenuBuilder new.
	self assert: builder itemList isNil.
	a class menuCommandOn: builder.
	self assert: builder itemList isCollection.
	self assert: builder itemList notEmpty.

]

{ #category : #'tests - group' }
CAArtworkTest >> testNumberOfGroup [
	| a1 a2 |
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	
	self assert: a numberOfGroups equals: 1.
	a1 := CAAddGroupAction new expressionAsString: '#odd'.
	a2 := CAAddGroupAction new expressionAsString: '#even'.
	
	a doAction: a1.
	self assert: a numberOfGroups equals: 2.

	a doAction: (CAAddGroupAction new expressionAsString: '#even').
	self assert: a numberOfGroups equals: 3.
	
]

{ #category : #'tests - edition' }
CAArtworkTest >> testRedo [
	self assert: a numberOfActions equals: 0.
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 1.
	self assert: a numberOfActionsToRedo equals: 0.
	
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 2.
	self assert: a numberOfActionsToRedo equals: 0.
	
	a doAction: (CAUndoAction new).
	self assert: a numberOfActions equals: 1.
	self assert: a numberOfActionsToRedo equals: 1.
	
	a doAction: (CAUndoAction new).
	self assert: a numberOfActions equals: 0.
	self assert: a numberOfActionsToRedo equals: 2.
	
	self assert: a view elements size equals: 0.
	
	a doAction: (CARedoAction new).
	self assert: a numberOfActions equals: 1.
	self assert: a numberOfActionsToRedo equals: 1.
	
	a doAction: (CARedoAction new).
	self assert: a numberOfActions equals: 2.
	self assert: a numberOfActionsToRedo equals: 0.
	
	self assert: a view elements size > 0.
]

{ #category : #'tests - group' }
CAArtworkTest >> testSelectAndUnselectGroup [
"NOT SURE WHAT TO DO HERE"

"	| noGroup oddGroup evenGroup |
	a doAction: (CAAddElementAction new expressionAsString: '#(1 2 3 4)').
	noGroup := a currentGroup.
	self assert: noGroup elements size equals: 4.
	self assert: (noGroup elements elementFromModel: 1) trachelShape color equals: RTShape defaultColor.
	
	a doAction: (CAAddGroupAction new expressionAsString: '#odd').
	oddGroup := a currentGroup.
	self assert: (noGroup elements elementFromModel: 1) trachelShape color equals: Color red.
	
	a doAction: (CAAddGroupAction new expressionAsString: '#even').
	evenGroup := a currentGroup.
	
	self assert: (noGroup elements elementFromModel: 1) trachelShape color equals: RTShape defaultColor.
"
]

{ #category : #'tests - edition' }
CAArtworkTest >> testUndo [
	self assert: a numberOfActions equals: 0.
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 1.
	self assert: a numberOfActionsToRedo equals: 0.
	
	a doAction: (CAAddElementAction new expressionAsString: '(1 to: 5)').
	self assert: a numberOfActions equals: 2.
	self assert: a numberOfActionsToRedo equals: 0.
	
	a doAction: (CAUndoAction new).
	self assert: a numberOfActions equals: 1.
	self assert: a numberOfActionsToRedo equals: 1.
	
	a doAction: (CAUndoAction new).
	self assert: a numberOfActions equals: 0.
	self assert: a numberOfActionsToRedo equals: 2.
	
	self assert: a view elements size equals: 0.
	
]

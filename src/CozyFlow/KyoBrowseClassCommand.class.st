Class {
	#name : #KyoBrowseClassCommand,
	#superclass : #SpSystemSelectionCommand,
	#instVars : [
		'selector'
	],
	#category : #'CozyFlow-Navigation'
}

{ #category : #default }
KyoBrowseClassCommand class >> defaultDescription [

	^ 'Power browse'
]

{ #category : #default }
KyoBrowseClassCommand class >> defaultShortcutKey [
	
	^ ($k command, $b command) mac | $k control win | $k control unix
]

{ #category : #default }
KyoBrowseClassCommand class >> shortName [

	^ 'Power browse'
]

{ #category : #execution }
KyoBrowseClassCommand >> execute [

	self context perform: self selector
]

{ #category : #accessing }
KyoBrowseClassCommand >> selector [

	^ selector ifNil: [ #kyoDoBrowseClass ]
]

{ #category : #accessing }
KyoBrowseClassCommand >> selector: aSelector [

	selector := aSelector
]

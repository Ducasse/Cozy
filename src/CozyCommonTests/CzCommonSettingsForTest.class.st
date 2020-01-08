Class {
	#name : #CzCommonSettingsForTest,
	#superclass : #CzCommonSettings,
	#classInstVars : [
		'values'
	],
	#category : #CozyCommonTests
}

{ #category : #customization }
CzCommonSettingsForTest class >> defaultScriptNames [

	^ #(#set1ForTest #raiseErrorForTest #set2ForTest) 
]

{ #category : #'as yet unclassified' }
CzCommonSettingsForTest class >> raiseErrorForTest [

	^ Error signal
]

{ #category : #'as yet unclassified' }
CzCommonSettingsForTest class >> reset [ 
	values := OrderedCollection new. 
]

{ #category : #'as yet unclassified' }
CzCommonSettingsForTest class >> set1ForTest [

	values add: 1
]

{ #category : #'as yet unclassified' }
CzCommonSettingsForTest class >> set2ForTest [

	values add: 2
]

{ #category : #accessing }
CzCommonSettingsForTest class >> values [
	^ values
]

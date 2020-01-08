Class {
	#name : #CozyRootTest,
	#superclass : #TestCase,
	#category : #CozyCommonTests
}

{ #category : #tests }
CozyRootTest >> testExecution [
	
	| setter |
	setter := CzCommonSettingsForTest reset.
	setter executeSetup.
	self assert: setter values asArray equals: #(1 2).
	
	
]

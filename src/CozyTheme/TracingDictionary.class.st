Class {
	#name : #TracingDictionary,
	#superclass : #Dictionary,
	#category : #CozyTheme
}

{ #category : #accessing }
TracingDictionary >> at: aKey [

	Transcript show: aKey printString; cr.
	^ super at: aKey 
]

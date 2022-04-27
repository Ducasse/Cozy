Class {
	#name : #TracingDictionary,
	#superclass : #Dictionary,
	#instVars : [
		'file'
	],
	#category : #'CozyTheme-fullyExperimentalBroken'
}

{ #category : #'instance creation' }
TracingDictionary class >> new [

	| inst | 
	inst := super new. 
	inst initFile.
	^ inst
]

{ #category : #accessing }
TracingDictionary >> at: aKey [

	Transcript show: aKey printString; cr.
	file writeStreamDo: [ :s | Time now printOn: s. s cr.  aKey printOn: s. s cr
		
		].
	^ super at: aKey 
]

{ #category : #accessing }
TracingDictionary >> initFile [

	 (FileSystem workingDirectory / 'loggg.txt') asFileReference ensureDelete.
	file := (FileSystem workingDirectory / 'loggg.txt') asFileReference
]

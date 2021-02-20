Class {
	#name : #TracingDictionary,
	#superclass : #Dictionary,
	#instVars : [
		'file'
	],
	#category : #CozyTheme
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
	file writeStreamDo: [ :s | s nextPutAll: aKey printString; cr
		
		].
	^ super at: aKey 
]

{ #category : #accessing }
TracingDictionary >> initFile [

	 (FileSystem workingDirectory / 'loggg.txt') asFileReference ensureDelete.
	file := (FileSystem workingDirectory / 'loggg.txt') asFileReference
]

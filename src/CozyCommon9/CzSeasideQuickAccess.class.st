Class {
	#name : #CzSeasideQuickAccess,
	#superclass : #CzQuickAccess,
	#category : #CozyCommon9
}

{ #category : #'seaside scripts' }
CzSeasideQuickAccess >> debuggerInImage [
	<cozyScript: #'Enable in image debugger'>
	self class environment
		at: #WAApplication
		ifPresent: [ :class | class allInstancesDo: [ :app | app exceptionHandler: (Smalltalk at: #WADebugErrorHandler) ] ]
		ifAbsent: [ self error: 'Seaside dev not loaded' ]
]

{ #category : #'seaside scripts' }
CzSeasideQuickAccess >> startOn8080 [
	<cozyScript: #'Start adaptor on 8080'>
	(self class environment at: #ZnZincServerAdaptor) startOn: 8080
]

{ #category : #'seaside scripts' }
CzSeasideQuickAccess >> startOn8080AndDebug [
	<cozyScript: #'Start adaptor on 8080 with debug mode'>
	self
		startOn8080;
		debuggerInImage
]

{ #category : #'seaside scripts' }
CzSeasideQuickAccess >> stopAdaptors [
	<cozyScript: #'Stop adaptors'>
	(self class environment at: #WAServerAdaptor) allSubInstances do: #stop
]

{ #category : #'seaside scripts' }
CzSeasideQuickAccess >> templateAddFileToLibraryFromURL [
	<cozyScript: #'_Template: URL to file library'>
	GTPlayground openContents: 'library := SYNFileLibrary.
url := ''http://synectique.eu/images/ada.png''.
fileName := ''ada.png''.

library addFileNamed: fileName contents: (ZnEasy get: url) contents'
]

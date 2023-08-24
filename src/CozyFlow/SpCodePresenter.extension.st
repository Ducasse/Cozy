Extension { #name : #SpCodePresenter }

{ #category : #'*CozyFlow' }
SpCodePresenter >> kyoDoBrowseClass [

	| result selector |
	result := self
		          evaluate: self selectedTextOrLine
		          onCompileError: [ ^ self ]
		          onError: [ :e | ^ self ].

	(result isKindOf: Symbol) ifTrue: [
		| classToBrowse |
		classToBrowse := self class environment at: result ifAbsent: [ nil ].
		classToBrowse ifNotNil: [
			^ self systemNavigation browse: classToBrowse ].
		^ self systemNavigation browseAllImplementorsOf: result ].
	self selectedTextOrLine first isUppercase ifTrue: [
		^ self systemNavigation browse: result ].
	selector := self selectedSelector ifNil: [ ^ nil ].
	selector ifNotNil: [
		^ self systemNavigation browseAllImplementorsOf: selector ].
	^ self systemNavigation browse: result
]

{ #category : #'*CozyFlow' }
SpCodePresenter >> kyoDoBrowseImplementors [

	| variableOrClassName variable |
	variableOrClassName := self selectedSelector ifNil: [ ^ nil ].
	variable := self lookupEnvironment lookupVar: variableOrClassName.

	"For global and class variables, implementors-of browses the class of the value of the variable, 
	for classes this means it browses the class"
	(variable isNotNil and: [
		 variable isGlobalVariable or: [ variable isClassVariable ] ])
		ifTrue: [
			variable value browse
			"pay attention to pass through the systemNavigation else we cannot write tests...!
			And BTW please write tests!" ]
		ifFalse: [
			| classToBrowse |
			classToBrowse := (self class environment bindingOf:
				                  variableOrClassName) value.
			classToBrowse isNotNil
				ifFalse: [
				self systemNavigation browseAllImplementorsOf: variableOrClassName ]
				ifTrue: [ self systemNavigation browse: classToBrowse ] ]
]

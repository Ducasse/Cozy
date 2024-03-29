Extension { #name : #ClyTextEditor }

{ #category : #'*CozyFlow' }
ClyTextEditor >> browseFullClass [
	"self lineSelectAndEmptyCheck: [^ self]."
	
	[ 
	self evaluateSelectionAndDo: [ :result |
			| classToBrowse |
			result isClass ifTrue: [ self browser browseClassNamed: result name. ^ self ].
			
			result isSymbol and: [ result first isUppercase 
				ifTrue: [ classToBrowse := self class environment at: result ifAbsent: [ nil ].
								classToBrowse 
									ifNil: [ classToBrowse := result class instanceSide name ]
									ifNotNil: [ classToBrowse := classToBrowse name ]
								]
				ifFalse: [ 
					result isSymbol
						ifTrue: [ ^ self implementorsOf: result ]
						ifFalse: [ classToBrowse := result class instanceSide name ] ].
			self browser browseClassNamed: classToBrowse  ]]
	] on: UndeclaredVariableRead do: [ :ex |      
		"Not really nice to have a dependency but let us revise it later"
		SystemNavigation default browseAllImplementorsOf: ex signaler name ]
]

{ #category : #'*CozyFlow' }
ClyTextEditor >> implementorsOfIt [

	| selector |
	(selector := self selectedSelector) isNil or: [ selector ifEmpty: [ ^ textArea flash ]].
	selector isCharacter ifTrue: [ ^ textArea flash ].
	self implementorsOf: selector
]

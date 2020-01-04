Extension { #name : #BlockClosure }

{ #category : #'*CozyCommon' }
BlockClosure >> spy [
	| res |
	TimeProfiler spyOn: [ res := self value ].
	^ res
]

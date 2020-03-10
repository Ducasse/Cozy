Extension { #name : #BlockClosure }

{ #category : #'*CozyCommon9' }
BlockClosure >> spy [
	| res |
	TimeProfiler spyOn: [ res := self value ].
	^ res
]

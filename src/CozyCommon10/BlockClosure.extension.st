Extension { #name : #BlockClosure }

{ #category : #'*CozyCommon10' }
BlockClosure >> spy [
	| res |
	TimeProfiler spyOn: [ res := self value ].
	^ res
]

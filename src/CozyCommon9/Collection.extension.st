Extension { #name : #Collection }

{ #category : #'*CozyCommon9' }
Collection >> mapWith: aValuable [
	^ (self collect: [ :e | e -> (aValuable value: e) ]) asDictionary
]

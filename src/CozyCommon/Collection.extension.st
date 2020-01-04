Extension { #name : #Collection }

{ #category : #'*CozyCommon' }
Collection >> mapWith: aValuable [
	^ (self collect: [ :e | e -> (aValuable value: e) ]) asDictionary
]

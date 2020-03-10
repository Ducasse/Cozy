Extension { #name : #RPackageOrganizer }

{ #category : #'*CozyCommon9' }
RPackageOrganizer class >> includingWith: aString [
	^ self default packages select: [ :p | p name includesSubstring: aString ]
]

{ #category : #'*CozyCommon9' }
RPackageOrganizer class >> startingWith: aString [
	^ self default packages select: [ :p | p name beginsWith: aString ]
]
